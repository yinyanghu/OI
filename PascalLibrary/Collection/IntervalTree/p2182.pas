program p2182;
const maxn=8000;
      infinity=1000000000;
      root=1;
var left,right,key,tot,pos:array[1..maxn*10] of longint;
    i,min,n:longint;
    a,ans:array[1..maxn] of longint;
procedure initialize;
 begin
     fillchar(left,sizeof(left),0);
     fillchar(right,sizeof(right),0);
     fillchar(key,sizeof(key),0);
     fillchar(tot,sizeof(tot),0);
     fillchar(pos,sizeof(pos),0);
 end;

procedure updata(k:longint);
 begin
     if key[k*2]<key[k*2+1] then begin
        pos[k]:=pos[k*2];
	key[k]:=key[k*2];
     end else begin
         key[k]:=key[k*2+1];
	 pos[k]:=pos[k*2+1];
     end;
 end;

procedure buildtree(k,l,r:longint);
 var mid:longint;
 begin
     left[k]:=l; right[k]:=r;
     if l+1=r then begin
         key[k]:=a[l];
	 pos[k]:=l;
	 exit;
     end;
     mid:=(l+r) shr 1;
     buildtree(k*2,l,mid);
     buildtree(k*2+1,mid,r);
     updata(k);
 end;

procedure passmark(k:longint);
 begin
     inc(tot[k*2],tot[k]);
     inc(tot[k*2+1],tot[k]);
     inc(key[k*2],tot[k]);
     inc(key[k*2+1],tot[k]);
     tot[k]:=0;
 end;

procedure modify(k,x:longint);
 var mid:longint;
 begin
     if (left[k]+1=right[k]) then begin
         key[k]:=infinity;
	 tot[k]:=0;
	 exit;
     end;
     if tot[k]<>0 then passmark(k);
     mid:=(left[k]+right[k]) shr 1;
     if x<mid then modify(k*2,x) else modify(k*2+1,x);
     updata(k);
 end;

procedure add(k,l,r:longint);
 var mid:longint;
 begin
     if (left[k]=l) and (right[k]=r) then begin
         inc(key[k]); inc(tot[k]);
	 exit;
     end;
     mid:=(left[k]+right[k]) shr 1;
     if r<=mid then add(k*2,l,r)
	else if l>=mid then add(k*2+1,l,r)
	    else begin
	        add(k*2,l,mid);
		add(k*2+1,mid,r);
	    end;
     updata(k);
 end;

begin
    readln(n); a[1]:=0;
    for i:=2 to n do readln(a[i]);
    initialize;
    buildtree(root,1,n+1);
    for i:=1 to n do begin
        min:=pos[root];
        modify(root,min);
        ans[min]:=i;
	if (min<>1) and (i<>n) then add(root,1,min);
    end;
    for i:=1 to n do writeln(ans[i]);
end.
