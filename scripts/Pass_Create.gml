///Pass_Create(Pass, File_Old, File_New);
// 선택된 파일을 암호화하고, 새롭게 저장합니다.
// file_old, 또는 file_new는 경로 지정과 함께 사용이 가능합니다.

var bin, sav, size;
var pass = argument0; 
var file_old = argument1;
var file_new = argument2;

bin = file_bin_open(file_old, 0); // 암호화할 파일 이름입니다.
sav = file_bin_open(file_new, 1); // 암호화 후에 저장될 파일 이름입니다.

file_bin_rewrite(sav); size = file_bin_size(bin);
repeat(size) {file_bin_write_byte(sav, (file_bin_read_byte(bin) + pass));}

file_bin_close(bin); file_bin_close(sav);
