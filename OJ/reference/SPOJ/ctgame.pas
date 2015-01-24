//Written on 6115 -- Jan 22, 2005
program rectbarn;
const
  maxsize=1000;
var
  h,l,r:array[1..maxsize]of word;
  t,u,m,n,i,j,left,right,ans:longint;
  c:char;
procedure update(left,right:word);
  var
    i,t:longint;
  begin
    for i:=left to right do begin
      inc(h[i]);
      if h[i]=1 then begin
        l[i]:=left;r[i]:=right;
      end
      else begin
        if left>l[i] then l[i]:=left;if right<r[i] then r[i]:=right;
      end;
      t:=h[i]*(r[i]-l[i]+1);
      if t>ans then ans:=t;
    end;
  end;
begin
  read(t);
  for u:=1 to t do begin
    readln(m,n);
    fillchar(h,sizeof(h),0);
    ans:=0;
    for i:=1 to m do begin
      left:=1;
      for j:=1 to n do begin
        read(c);
        if c='R' then begin
          right:=j-1;
          update(left,right);
          h[j]:=0;left:=j+1;
        end;
        if j=n then readln else read(c);
      end;
      if left<=n then update(left,n);
    end;
    writeln(ans*3);
  end;
end.
