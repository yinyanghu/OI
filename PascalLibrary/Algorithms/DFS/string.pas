var a,b:string;
    n,answer:integer;
    len:array[1..6] of integer;
    s1,s2:array[1..6] of string;
procedure reads(var s1,s2:string);
 var s:string;
 begin
     readln(s);
     s1:=copy(s,1,pos(' ',s)-1);
     s2:=copy(s,pos(' ',s)+1,length(s)-pos(' ',s));
 end;

function max(a,b:integer):integer;
 begin
     if a>b then max:=a else max:=b;
 end;

procedure search(depth:integer; s:string; last:integer);
 var i,j,l:integer;
 begin
     if (depth=0) then begin
         if s=b then begin
             writeln(answer);
             close(output);
             halt;
         end;
         exit;
     end;
     l:=length(s);
     dec(depth);
     for i:=1 to n do
       for j:=max(1,last-len[i]+1) to l-len[i]+1 do
         if (copy(s,j,len[i])=s1[i]) then
           search(depth,copy(s,1,j-1)+s2[i]+copy(s,j+len[i],l-j-len[i]+1),j);
 end;

begin
    assign(input,'string.in'); reset(input);
    assign(output,'string.out'); rewrite(output);
    reads(a,b);
    n:=0;
    while not seekeof do begin
        inc(n);
        reads(s1[n],s2[n]);
        len[n]:=length(s1[n]);
    end;
    close(input);
    for answer:=0 to 10 do search(answer,a,1);
    writeln('No Answer!');
    close(output);
end.
