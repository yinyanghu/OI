program well;
var h,f,t:array[1..100] of integer;
    d,g,min,ml:longint;


procedure sort(n:integer);
 var i,j:integer;
 procedure swap(var a,b:integer);
  var x:integer;
  begin
      x:=a; a:=b; b:=x;
  end;
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
     sort(g);
     min:=maxlongint;
     ml:=maxlongint;
 end;

{t--tou food time; f--add live time; h--add high}
procedure search(k,high,lv:integer);
 var i,j:integer;
 begin
     if high>=d then begin
         if t[k-1]<min then min:=t[k-1];
         exit;
     end;
     if (k>g) and (high<d) then begin
         if lv<ml then ml:=lv;
         exit;
     end;
     if k<=g then begin
         if lv>=t[k+1] then search(k+1,high+h[k],lv);
         search(k+1,high,lv+f[k]);
     end;
 end;

procedure print;
 begin
     assign(output,'well.out'); rewrite(output);
     if min<>maxlongint then writeln(min)
       else writeln(ml);
     close(output);
 end;

begin
    init;
    search(1,0,10);
    print;
end.
