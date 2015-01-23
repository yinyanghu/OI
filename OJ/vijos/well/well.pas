program well;
var h,f,t:array[1..100] of integer;
    d,g:longint;
    a:array[0..200,1..5000] of boolean;

procedure swap(var a,b:integer);
 var x:integer;
 begin
     x:=a; a:=b; b:=x;
 end;

procedure sort(n:integer);
 var i,j:integer;
 begin
     for i:=1 to n-1 do
       for j:=i+1 to n do
         if t[i]>t[j] then begin
             swap(f[i],f[j]);
             swap(t[i],t[j]);
             swap(h[i],h[j]);
         end;
 end;

procedure init;
 var i:integer;
 begin
     assign(input,'well.in'); reset(input);
     readln(d,g);
     for i:=1 to g do read(t[i],f[i],h[i]);
     close(input);
 end;

 {t--tou food time; f--add live time; h--add high}
procedure main;
 var i,j,k,lv:integer;
 begin
     sort(g);
     lv:=0;
     for i:=1 to g do if t[i]>lv then lv:=t[i];
     lv:=lv+10;
     for i:=1 to g do lv:=lv+f[i];
     fillchar(a,sizeof(a),false);
     a[0,10]:=true;
     for k:=1 to g do
       for i:=d-1 downto 0 do
         for j:=lv downto t[k] do
           if a[i,j] then begin
               a[i+h[k],j]:=true;
               if (i+h[k]>=d) then begin
                   writeln(t[k]);
                   exit;
               end;
               a[i,j+f[k]]:=true;
           end;
     for i:=lv downto 1 do if a[0,j] then begin
         writeln(j);
         exit;
     end;
 end;


begin
    init;
    assign(output,'well.out'); rewrite(output);
    main;
    close(output);
end.