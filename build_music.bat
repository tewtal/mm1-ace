wla-6502 -o stage2.asm 
wla-6502 -o stage3.asm 
wla-6502 -o pcm_eor.asm

wlalink -b stage2.cfg stage2.bin
wlalink -b stage3.cfg stage3.bin
wlalink -b pcm_eor.cfg pcm_eor.bin

convert_bin.py 1 2 stage2.bin
reverse_input.py stage2.inp
convert_bin.py 1 2 stage3.bin
convert_bin.py 1 1 pcm_eor.bin

copy stage2.rev.inp + stage3.inp + pcm_eor.inp console.inp
create_r16m.py console.inp
copy /b mm_base.r16m + console.r16m build_music.r16m
