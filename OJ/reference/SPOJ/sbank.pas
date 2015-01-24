//Written on 6452 -- Dec 25, 2005
program sbank;
{$Q-,R-}
const
  maxn=100000;
  len=26;
  pos:array[1..len]of byte=(1,2,4,5,6,7,8,9,10,11,
      13,14,15,16,18,19,20,21,23,24,25,26,28,29,30,31);
var
  digit:array[0..maxn*len]of char;
  child,brother:array[0..maxn*len]of longint;
  count:array[1..maxn]of longint;
  t,u,n,i,l1,l2:longint;
  s:string;
procedure ins;
  var
    i,p:longint;
    c:char;
  begin
    p:=0;
    for i:=1 to len do begin
      repeat read(c);until c>' ';
      if digit[child[p]]>c then begin
        inc(l1);brother[l1]:=child[p];child[p]:=l1;
        p:=l1;digit[p]:=c;
      end
      else begin
        p:=child[p];
        while digit[brother[p]]<=c do p:=brother[p];
        if digit[p]<c then begin
          inc(l1);brother[l1]:=brother[p];brother[p]:=l1;
          p:=l1;digit[p]:=c;
        end;
      end;
    end;
    readln;
    if child[p]>0 then
      inc(count[child[p]])
    else begin
      inc(l2);child[p]:=l2;count[l2]:=1;
    end;
  end;
procedure traverse(l,p:longint);
  begin
    if l>len then
      writeln(s,count[child[p]])
    else begin
      p:=child[p];
      repeat
        s[pos[l]]:=digit[p];
        traverse(l+1,p);
        p:=brother[p];
      until p=0;
    end;
  end;
begin
  digit[0]:='~';//infinity
  s:='00 00000000 0000 0000 0000 0000 ';
  read(t);
  for u:=1 to t do begin
    fillchar(child,sizeof(child),0);
    fillchar(brother,sizeof(brother),0);
    l1:=0;l2:=0;
    readln(n);
    for i:=1 to n do
      ins;
    if u>1 then writeln;
    traverse(1,0);
  end;
end.
