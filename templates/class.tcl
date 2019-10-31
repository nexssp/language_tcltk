package require itcl

itcl::class Car {
    private variable wheels 4
    private variable doors 4
    private variable brand mazda
    private variable speed 0

    constructor {w d b} {
        set wheels $w
        set doors $d
        set brand $b
        puts "New Car is made called $this . specs are: wheels=$wheels | doors=$doors | brand=$brand"
    }
}