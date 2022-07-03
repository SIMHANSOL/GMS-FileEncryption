///Pass_Destroy(Pass, File_Old, File_New, Spr_Num, Mod);
// 파일을 다시 복호화합니다.
// file_old, 또는 file_new는 경로 지정과 함께 사용이 가능합니다.
// 모드에 따라 방식이 변경됩니다.
// 0: 일반 복호화.
// 1: 해당 이름으로 0, 0을 기준점으로 스프라이트 생성.
// 2: 해당 이름으로 중심을 기준점으로 스프라이트 생성.

var bin, sav, size;
var pass = argument0; 
var file_old = argument1;
var file_new = argument2;
var spr_num = argument3;
var set = argument4;

bin = file_bin_open(file_old, 0); // 복호화할 파일 이름입니다.
sav = file_bin_open(file_new, 1); // 복호화 후에 저장될 파일 이름입니다.

file_bin_rewrite(sav); size = file_bin_size(bin);
repeat(size) {file_bin_write_byte(sav, (file_bin_read_byte(bin) - pass));}

file_bin_close(bin); file_bin_close(sav);

switch(set)
{
    case 1:
    {
        set = sprite_add(file_new, 0, false, false, 0, 0);
        file_delete(file_new);
        break;
    }
    case 2:
    {
        set = sprite_add(file_new, 0, false, false, 0, 0);
        file_delete(file_new);
        sprite_set_offset(set, (sprite_get_width(set) / 2), (sprite_get_height(set) / 2));
        break;
    }
}

return set;
