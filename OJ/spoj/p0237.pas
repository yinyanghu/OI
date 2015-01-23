program p0237;
var s:array[0..99] of word;
    t,u,n,i,j,a,p,q:word;
begin
    read(t);
    for u:=1 to t do begin
        read(n);
        a:=0; fillchar(s,sizeof(s),0);
        for i:=1 to n do
          for j:=i downto 1 do begin
              read(p);
              if (j>1) and (s[j]>s[j-1]) then q:=s[j] else q:=s[j-1];
              s[j]:=p+q;
              if p+q>a then a:=p+q;
          end;
        writeln(a);
    end;
end.
{var s:array[0..99]of word;t,u,n,i,j,a,p,q:word;begin read(t);for u:=1 to t do begin read(n);a:=0;for i:=1 to n do for j:=99-i to 98 do begin read(p);if(j>99-i)and(s[j]>s[j+1])then q:=s[j]else q:=s[j+1];s[j]:=p+q;if p+q>a then a:=p+q;end;writeln(a);end;
end.}