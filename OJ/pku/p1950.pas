program p1950;
const maxn=15;
      value:array[1..maxn] of longint=(0,0,1,1,1,1,6,10,11,17,88,162,197,437,1350);
var n,total:longint;
function check(s:string):boolean;
 var i,key,temp,k:longint;
     sign:char;
 begin
     s:=s+'+';
     key:=0; temp:=0;
     sign:='+';
     for i:=1 to length(s) do begin
         if (s[i]='.') or (s[i]=' ') then continue;
         if (s[i]='+') or (s[i]='-') then begin
             if sign='+' then key:=key+temp else key:=key-temp;
             sign:=s[i];
             temp:=0;
         end else begin
             val(s[i],k);
             temp:=temp*10+k;
         end;
     end;
     if key=0 then check:=true else check:=false;
 end;

procedure dfs(k:longint; s:string);
 var x:string;
     i:longint;
 begin
     if (k=n) then begin
     	 if check(s) then begin
             inc(total);
             writeln(s);
             if total=20 then begin
                 writeln(value[n]);
                 halt;
             end;
         end;
         exit;
     end;
     str(k+1,x);
     dfs(k+1,s+' + '+x);
     dfs(k+1,s+' - '+x);
     dfs(k+1,s+' . '+x);
 end;

begin
    readln(n);
    total:=0;
    dfs(1,'1');
    writeln(total);
end.