# Based on gist: https://gist.github.com/yyamasak/e4590ae96ea7f0abbb57dec1cada0348
package require Tk
package require Img
package require twapi

# http://wiki.tcl.tk/15647
# Copy the contents of the Windows clipboard into a photo image.
# Return the photo image identifier.
proc Clipboard2Img {} {
	twapi::open_clipboard
	
	# Assume clipboard content is in format 8 (CF_DIB)
	set retVal [catch {twapi::read_clipboard 8} clipData]
	if { $retVal != 0 } {
		error "Invalid or no content in clipboard"
	}
	
	# First parse the bitmap data to collect header information
	binary scan $clipData "iiissiiiiii" \
		size width height planes bitcount compression sizeimage \
		xpelspermeter ypelspermeter clrused clrimportant
	
	# We only handle BITMAPINFOHEADER right now (size must be 40)
	if {$size != 40} {
		error "Unsupported bitmap format. Header size=$size"
	}
	
	# We need to figure out the offset to the actual bitmap data
	# from the start of the file header. For this we need to know the
	# size of the color table which directly follows the BITMAPINFOHEADER
	if {$bitcount == 0} {
		error "Unsupported format: implicit JPEG or PNG"
	} elseif {$bitcount == 1} {
		set color_table_size 2
	} elseif {$bitcount == 4} {
		# TBD - Not sure if this is the size or the max size
		set color_table_size 16
	} elseif {$bitcount == 8} {
		# TBD - Not sure if this is the size or the max size
		set color_table_size 256
	} elseif {$bitcount == 16 || $bitcount == 32} {
		if {$compression == 0} {
			# BI_RGB
			set color_table_size $clrused
		} elseif {$compression == 3} {
			# BI_BITFIELDS
			set color_table_size 3
		} else {
			error "Unsupported compression type '$compression' for bitcount value $bitcount"
		}
	} elseif {$bitcount == 24} {
		set color_table_size $clrused
	} else {
		error "Unsupported value '$bitcount' in bitmap bitcount field"
	}
	
	set phImg [image create photo]
	set filehdr_size 14                 ; # sizeof(BITMAPFILEHEADER)
	set bitmap_file_offset [expr {$filehdr_size+$size+($color_table_size*4)}]
	set filehdr [binary format "a2 i x2 x2 i" \
		"BM" [expr {$filehdr_size + [string length $clipData]}] \
		$bitmap_file_offset]
	
	append filehdr $clipData
	$phImg put $filehdr -format BMP
	
	twapi::close_clipboard
	return $phImg
}

twapi::send_keys {{PRTSC}}; # If you have another program like SnagIt, this won't work.

after 200; # avoid an access denied error.

set ts [clock format [clock seconds] -format "%Y%m%d%H%M%S"]
set filename "screenshotfull_$ts.bmp"

set phImg [Clipboard2Img]

$phImg write [file rootname $filename].png -format PNG

exit