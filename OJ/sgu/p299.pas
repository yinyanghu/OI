program p299;
const maxn=1000;
      maxlen=500 div 8+1;
      bit=100000000;
      bitlen=8;
type node=record
         len:longint;
         d:array[1..maxlen] of longint;
     end;
var n,i:longint;
    p:array[1..maxn] of longint;
    a:array[1..maxn] of node;

procedure readhp(var a:node);
 var i,code:longint;
     st:ansistring;
 begin
     with a do begin
	 readln(st);
	 i:=length(st);
	 len:=0;
	 while i>=bitlen do begin
	     inc(len);
	     dec(i,bitlen);
	     val(copy(st,i+1,bitlen),d[len],code);
	 end;
	 if i>0 then begin
	     inc(len);
	     val(copy(st,1,i),d[len],code);
	 end;
     end;
 end;

procedure writehp(const a:node);
 var i,j:longint;
     st:string[bitlen];
 begin
     with a do begin
	 write(d[len]);
	 for i:=len-1 downto 1 do begin
	     str(d[i]:bitlen,st);
	     for j:=1 to bitlen do
	     if st[j]=' ' then st[j]:='0';
	     write(st);
	 end;
     end;
 end;

function add(const a,b:node):node;
 var i,r:longint;
 begin
     fillchar(add,sizeof(add),0);
     i:=1; r:=0;
     while (i<=a.len) or (i<=b.len) or (r>0) do begin
         add.d[i]:=r; r:=0;
         if i<=a.len then inc(add.d[i],a.d[i]);
         if i<=b.len then inc(add.d[i],b.d[i]);
         if add.d[i]>=bit then begin
	     r:=1;
             dec(add.d[i],bit);
	 end;
         inc(i);
     end;
     add.len:=i-1;
 end;

function minus(const a,b:node):node;
 var i,r:longint;
 begin
     fillchar(minus,sizeof(minus),0);
     i:=1; r:=0;
     while (i<=a.len) or (i<=b.len) or (r<0) do begin
         minus.d[i]:=r;
	 r:=0;
         if i<=a.len then inc(minus.d[i],a.d[i]);
         if i<=b.len then dec(minus.d[i],b.d[i]);
         if minus.d[i]<0 then begin
	     r:=-1;
             inc(minus.d[i],bit);
	 end;
	 inc(i);
     end;
     minus.len:=i-1;
     with minus do
       while (d[len]=0) and (len>1) do dec(len);
 end;

function compare(const a,b:node):longint;
 var i:longint;
 begin
     compare:=a.len-b.len;
     if compare<>0 then exit;
     i:=a.len;
     while (a.d[i]=b.d[i]) and (i>1) do dec(i);
     compare:=a.d[i]-b.d[i];
 end;

procedure quicksort(l,r:longint);
 var i,j,mid,k:longint;
 begin
     i:=l; j:=r; mid:=p[(i+j) div 2];
     repeat
        while compare(a[p[i]],a[mid])<0 do inc(i);
	while compare(a[p[j]],a[mid])>0 do dec(j);
	if i<=j then begin
	    k:=p[i]; p[i]:=p[j]; p[j]:=k;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then quicksort(l,j);
     if i<r then quicksort(i,r);
 end;

begin
    readln(n);
    for i:=1 to n do begin
	readhp(a[i]);
	p[i]:=i;
    end;
    quicksort(1,n);
    for i:=3 to n do
      if (compare(minus(a[p[i-1]],a[p[i-2]]),a[p[i]])<0) and (compare(add(a[p[i-1]],a[p[i-2]]),a[p[i]])>0) then	begin
	  writehp(a[p[i-2]]);
	  write(' ');
	  writehp(a[p[i-1]]);
	  write(' ');
	  writehp(a[p[i]]);
	  writeln;
          halt;
      end;
    writeln('0 0 0');
end.

{
program p299;
const maxn=1000;
      maxlen=500 div 8+1;
      bit=100000000;
      bitlen=8;
type node=record
         len:longint;
         d:array[1..maxlen] of longint;
     end;
var n,i:longint;
    p:array[1..maxn] of longint;
    a:array[1..maxn] of node;

procedure readhp(var a:node);
var i,code:longint;
     st:ansistring;
begin
     with a do begin
         readln(st);
         i:=length(st);
         len:=0;
         while i>=bitlen do begin
             inc(len);
             dec(i,bitlen);
             val(copy(st,i+1,bitlen),d[len],code);
         end;
         if i>0 then begin
             inc(len);
             val(copy(st,1,i),d[len],code);
         end;
     end;
end;

procedure writehp(const a:node);
var i,j:longint;
     st:string[bitlen];
begin
     with a do begin
         write(d[len]);
         for i:=len-1 downto 1 do begin
             str(d[i]:bitlen,st);
             for j:=1 to bitlen do
             if st[j]=' ' then st[j]:='0';
             write(st);
         end;
     end;
end;

function add(const a,b:node):node;
var i,r:longint;
begin
     fillchar(result,sizeof(result),0);
     i:=1; r:=0;
     while (i<=a.len) or (i<=b.len) or (r>0) do begin
         result.d[i]:=r; r:=0;
         if i<=a.len then inc(result.d[i],a.d[i]);
         if i<=b.len then inc(result.d[i],b.d[i]);
         if result.d[i]>=bit then begin
             r:=1;
             dec(result.d[i],bit);
         end;
         inc(i);
     end;
     result.len:=i-1;
end;

function minus(const a,b:node):node;
var i,r:longint;
begin
     fillchar(result,sizeof(result),0);
     i:=1; r:=0;
     while (i<=a.len) or (i<=b.len) or (r<0) do begin
         result.d[i]:=r;
         r:=0;
         if i<=a.len then inc(result.d[i],a.d[i]);
         if i<=b.len then dec(result.d[i],b.d[i]);
         if result.d[i]<0 then begin
             r:=-1;
             inc(result.d[i],bit);
         end;
         inc(i);
     end;
     result.len:=i-1;
     with result do
       while (d[len]=0) and (len>1) do dec(len);
end;

function compare(const a,b:node):longint;
var i:longint;
begin
     result:=a.len-b.len;
     if result<>0 then exit;
     i:=a.len;
     while (a.d[i]=b.d[i]) and (i>1) do dec(i);
     result:=a.d[i]-b.d[i];
end;

procedure quicksort(l,r:longint);
var i,j,mid,k:longint;
begin
     i:=l; j:=r; mid:=p[(i+j) div 2];
     repeat
        while compare(a[p[i]],a[mid])<0 do inc(i);
        while compare(a[p[j]],a[mid])>0 do dec(j);
        if i<=j then begin
            k:=p[i]; p[i]:=p[j]; p[j]:=k;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then quicksort(l,j);
     if i<r then quicksort(i,r);
end;

begin
    readln(n);
    for i:=1 to n do begin
        readhp(a[i]);
        p[i]:=i;
    end;
    quicksort(1,n);
    for i:=3 to n do
      if (compare(minus(a[p[i-1]],a[p[i-2]]),a[p[i]])<0) and (compare(add(a[p[i-1]],a[p[i-2]]),a[p[i]])>0) then        begin
          writehp(a[p[i-2]]);
          write(' ');
          writehp(a[p[i-1]]);
          write(' ');
          writehp(a[p[i]]);
          writeln;
          halt;
      end;
    writeln('0 0 0');
end.
}