program storage;
var l,f,s:array[1..10000] of integer;
    n,i,j,k:integer;
begin
    assign(input,'storage.in'); reset(input);
    assign(output,'storage.out'); rewrite(output);
    readln(n);
    for i:=1 to n do readln(l[i],f[i]);
    for i:=1 to n do s[i]:=i;
    for i:=1 to n-1 do
      for j:=i+1 to n do
        if (f[s[i]]/1000*l[s[i]]<f[s[j]]/1000*l[s[j]])
          then begin
              k:=s[i]; s[i]:=s[j]; s[j]:=k;
          end;
    for i:=1 to n-1 do write(s[i],' ');
    write(s[n]);
    close(input);
    close(output);
end.