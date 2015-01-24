@echo off
test.exe
copy bst.in splay.in
bst.exe
splay.exe
fc bst.out splay.out