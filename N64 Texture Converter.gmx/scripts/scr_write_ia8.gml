// Argument0 - The file to write
// Argument1 - The file writing function
// Argument2 - The starting X coordinate
// Argument3 - The starting Y coordinate
// Argument4 - The ending X coordinate
// Argument5 - The ending Y coordinate
// Argument6 - The size (in bytes)

var file = argument0
var write = argument1
var sx = argument2
var sy = argument3
var ex = argument4
var ey = argument5
var size = argument6
var i, j;

for (j=sy; j<ey; j+=1)
{
    // Tab the array (4 spaces) if we're using a text file
    if (global.exportfile != "B")
        script_execute(write, file, "    ");

    for (i=sx; i<ex; i+=1)
    {
        var texel;
        var gray = bitcrunch(rgb_to_gray(obj_sprite.sprite_color[i, j]), 4)
        var alpha = bitcrunch((obj_sprite.sprite_alpha[i, j]&$FF), 4) 
        if (i >= obj_sprite.sprite_width || j >= obj_sprite.sprite_height)
            texel = 0
        else
            texel = (gray<<4)|alpha
        if (global.exportfile != "B")
        {
            var k=0;
            texel = "0x"+dec_to_hex(texel, 1)+", "
        }
        script_execute(write, file, texel, size);
    }
    
    // Write a new line if we're using a text file
    if (global.exportfile != "B")
        script_execute(write, file, "\n");
}
