program windshadow;
const a:array[1..5] of char=('1','3','5','7','9');
var l,r:longint;

procedure prim(x:longint);
 var i,k:longint;
     ok:boolean;
begin
     k:=trunc(sqrt(x))+1;
     for i:=2 to k do begin
         ok:=true;
         if (x mod i=0) then begin
             ok:=false;
             break;
         end;
     end;
     if ok and (x>=l) and (x<=r) then writeln(x);

 end;

procedure search(s:string; i,j:longint);
 var s1:string;
     c:char;
     x,k,code:longint;
begin
    if i*2>=j then begin
       s1:='';
       for x:=1 to length(s) do s1:=s[x]+s1;
       if j mod 2=1 then delete(s1,1,1);
       s1:=s+s1;
       val(s1,k,code);
       prim(k);
    end else for c:='0'to '9' do search(s+c,i+1,j);
end;



procedure main;
 var s1,s2:string;
     i,j,k:longint;
 begin
     if r=100000000 then r:=99999999;
     str(r,s2);
     k:=length(s2);
     for i:=1 to k do
       for j:=1 to 5 do search(a[j],1,i);
 end;


begin
    readln(l,r);
    main;
end.
