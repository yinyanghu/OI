program nqueen;
var n,upperlim,sum:longint;
procedure test(row,ld,rd:longint);   //ע���԰˻ʺ�Ϊ��
var
   pos,p:longint;
begin
   if row<>upperlim then  //row=00101110��ʾ�ݹ鵽�����У���3��5��6��7�������лʺ�
   begin
      pos:=upperlim and not (row or ld or rd);  //pos��ʾ�������к����ζԽ���(ld��rd)��ǰ��һ�п��Էŵ�λ��
      while pos<>0 do  //pos�������1���������˲��˳�whileѭ��
      begin
         p:=pos and -pos;  //x and -x�ȼ��ڸղ���ϰ������һ��
         pos:=pos-p;  //pλ�ô�����
         test(row+p,(ld+p)shl 1,(rd+p)shr 1);  //�ݹ飬���Ĳ������Խ��߶���һ�е�Ӱ��Ҫƽ��һλ
      end;
   end
   else inc(sum);  //��row=11111111ʱ�ҵ�һ����
end;

begin
    readln(n);
    upperlim:=(1 shl n)-1;
    test(0,0,0);
    writeln(sum);
    readln;
end.