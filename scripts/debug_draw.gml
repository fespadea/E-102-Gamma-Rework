//debug


// with pHitBox {
//     if(orig_player == other.player && attack == AT_FSPECIAL){
//         var distance = 25;
//         var xOffset = x + distance*dcos(proj_angle);
//         var yOffset = y - distance*dsin(proj_angle);
//         print(distance*dsin(proj_angle))
//         draw_circle_color(xOffset, yOffset, 10, c_red, c_red, false)
//     }
// }

// with obj_article1 {
//     draw_circle_color(x + 4*spr_dir, y + 12, 1, c_red, c_red, false);
//     draw_circle_color(x + 4*spr_dir - 14 + hsp, y + 12 + 13 + vsp, 1, c_red, c_red, false);
// }

with pHitBox{
    if "targetX" in self{
        draw_circle_color(targetX, targetY, 1, c_red, c_red, -1);
    }
}