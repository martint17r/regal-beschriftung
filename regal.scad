// Bookshelf Tag

shelfthick = 18; // thickness of shelf
clipthick = .75; // thickness of clip
cliplen = 8;     // length of legs
clipangle = 5;   // inward angle of legs
clipwid = 25;    // width of clip - make sure that letters fit!
engrave = .5;    // height of letter
nub = .3;        // size of nub on legs


// list of characters to print - wil create rows of 10

s = nub * 2 / 1.4;
xoffset = cliplen + 3;
yoffset = clipwid + 4;

for(i = [0:0]) {
    x = i % 10;
    y = (i-x) / 10;
    translate([x * xoffset, y * yoffset, 0]) {
        cube([clipthick, shelfthick, clipwid]);
        translate([0,shelfthick,0]) rotate([0,0,-clipangle]) {
            cube([cliplen,clipthick,clipwid]);
            translate([cliplen - nub,-nub,0]) rotate([0,0,45]) cube([s, s, clipwid]);
        }
    translate([0,0,0]) rotate([0,0,clipangle]) {
        cube([cliplen,clipthick,clipwid]);
        translate([cliplen - nub,clipthick-nub,0]) rotate([0,0,45]) cube([s, s, clipwid]);
    }
    translate([0,shelfthick/2,clipwid/2]) rotate([0,-90,0]) linear_extrude(height=engrave) text(text=str(26), size=shelfthick-5, valign="center", halign="center");
}
}
