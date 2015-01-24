program check;
var a:array[1..100000] of longint;
    i,j,k,min,max,m,n,p,q:longint;
    ch:char;
begin
    assign(input,'intree.in'); reset(input);
    assign(output,'test.out'); rewrite(output);
    readln(n,m);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do read(a[i]);
    readln;
    for i:=1 to m do begin
        read(ch); read(ch);
        case ch of
            'O':begin
                    while ch<>' ' do read(ch);
                    readln(j,k);
                    a[j]:=k;
                end;
            'I':begin
                    while ch<>' ' do read(ch);
                    readln(p,q);
                    min:=a[p];
                    for j:=p+1 to q do
                      if min>a[j] then min:=a[j];
                    writeln(min);
                end;
            'A':begin
                    while ch<>' ' do read(ch);
                    readln(p,q);
                    max:=a[p];
                    for j:=p+1 to q do
                      if a[j]>max then max:=a[j];
                    writeln(max);
                end;
        end;
    end;
    close(input);
    close(output);
end.