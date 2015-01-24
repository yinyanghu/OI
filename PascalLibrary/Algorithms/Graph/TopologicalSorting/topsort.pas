program topsort;
var d:array['A'..'Z'] of integer;
    g:array['A'..'Z','A'..'Z'] of boolean;
    s:array['A'..'Z'] of boolean;
    size:integer;
    queue:array[1..26] of char;

procedure init;
 var i:integer;
     a,b,ch:char;
 begin
     fillchar(g,sizeof(g),false);
     fillchar(s,sizeof(s),false);
     assign(input,'topsort.in'); reset(input);
     assign(output,'topsort.out'); rewrite(output);
     while (not eof) do begin
         readln(a,ch,b);
         s[a]:=true;
         s[b]:=true;
         g[a,b]:=true;
     end;
     close(input);
 end;

procedure solve;
 var a,b:char;
     i:integer;
     change:boolean;
 begin
     size:=0;
     fillchar(d,sizeof(d),0);
     for a:='A' to 'Z' do
       for b:='A' to 'Z' do
         if (g[a,b]) then d[b]:=d[b]+1;
     repeat
        change:=false;
        for a:='A' to 'Z' do
           if (s[a]) and (d[a]=0) then begin
               s[a]:=false;
               size:=size+1;
               queue[size]:=a;
               for b:='A' to 'Z' do
                 if (g[a,b]) then d[b]:=d[b]-1;
               change:=true;
           end;
     until not change;
     for a:='A' to 'Z' do
       if (s[a]) then begin
          writeln('No solution.');
          exit;
       end;
     for i:=1 to size do write(queue[i]);
     close(output);
 end;

begin
    init;
    solve;
end.
