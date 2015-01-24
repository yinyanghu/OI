{
ID:lijianx1
PROG:zerosum
LANG:PASCAL
}
program zerosum;
const maxn=9;
var n:longint;
    a:array[1..maxn] of char;
procedure init;
 begin
     assign(input,'zerosum.in'); reset(input);
     readln(n);
     close(input);
 end;

procedure print;
 var i:longint;
 begin
     write('1');
     for i:=1 to n-1 do write(a[i],i+1);
     writeln;
 end;

procedure dfs(k,sum,last:longint);
 begin
     if k=n then begin
	 if (sum=0) then print;
	 exit;
     end;
     a[k]:=' ';
     if last>0 then dfs(k+1,sum-last+last*10+k+1,last*10+k+1)
	else dfs(k+1,sum-last+last*10-k-1,last*10-k-1);
     a[k]:='+';
     dfs(k+1,sum+k+1,k+1);
     a[k]:='-';
     dfs(k+1,sum-k-1,-k-1);
 end;


procedure main;
 begin
     assign(output,'zerosum.out'); rewrite(output);
     dfs(1,1,1);
     close(output);
 end;

begin
    init;
    main;
end.
