program nqueen;
var n,upperlim,sum:longint;
procedure test(row,ld,rd:longint);   //注释以八皇后为例
var
   pos,p:longint;
begin
   if row<>upperlim then  //row=00101110表示递归到第五行，第3、5、6、7纵列已有皇后
   begin
      pos:=upperlim and not (row or ld or rd);  //pos表示考虑纵列和主次对角线(ld与rd)后当前这一行可以放的位置
      while pos<>0 do  //pos里的所有1都处理完了才退出while循环
      begin
         p:=pos and -pos;  //x and -x等价于刚才练习题的最后一个
         pos:=pos-p;  //p位置处理了
         test(row+p,(ld+p)shl 1,(rd+p)shr 1);  //递归，更改参数；对角线对下一行的影响要平移一位
      end;
   end
   else inc(sum);  //当row=11111111时找到一个解
end;

begin
    readln(n);
    upperlim:=(1 shl n)-1;
    test(0,0,0);
    writeln(sum);
    readln;
end.