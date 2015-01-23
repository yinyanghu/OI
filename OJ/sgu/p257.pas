program p257;
const st:array[1..8] of string=('SSS','SSB','SBS','BSS','SBB','BSB','BBS','BBB');
      delta:array[1..8,1..3] of longint=((0,0,0),(0,0,1),(0,1,0),(1,0,0),(0,1,1),(1,0,1),(1,1,0),(1,1,1));
      name:array[1..3] of char=('P','O','S');
      maxn=13;
type node=record
         pre,aug,x:longint;
     end;
var a,f:array[1..maxn,1..maxn] of longint;
    flag:array[1..100000] of longint;
    w:array[1..3] of longint;
    n:longint;
procedure buildmap;
 var i,j,k:longint;
     s:string;
 begin
     fillchar(a,sizeof(a),0);
     for i:=10 to 12 do begin
         read(w[i-9]); a[i,13]:=w[i-9] div 2;
     end;
     readln(n);
     for i:=1 to n do begin
         readln(s);
         for j:=1 to 8 do
             if st[j]=s then begin
                 inc(a[1,j+1]);
                 for k:=1 to 3 do inc(a[j+1,k+9],delta[j,k]);
                 flag[i]:=j;
                 break;
             end;
     end;
 end;

procedure netflow;
 var used:array[1..maxn] of boolean;
     q:array[1..100] of node;
     ans,p:longint;
 function findaugpath:boolean;
  var l,r,i:longint;
  begin
      fillchar(used,sizeof(used),true);
      l:=0; r:=1; q[1].x:=1; q[1].aug:=maxlongint;
      used[1]:=false;
      while l<r do begin
          inc(l);
          for i:=1 to maxn do
              if (used[i]) and (a[q[l].x,i]>f[q[l].x,i]) then begin
                  used[i]:=false; inc(r);
                  q[r].x:=i; q[r].aug:=a[q[l].x,i]-f[q[l].x,i];
                  if q[l].aug<q[r].aug then q[r].aug:=q[l].aug;
                  q[r].pre:=l;
              end else if (used[i]) and (f[i,q[l].x]>0) then begin
                  used[i]:=false; inc(r);
                  q[r].x:=i; q[r].aug:=f[i,q[l].x];
                  if q[l].aug<q[r].aug then q[r].aug:=q[l].aug;
                  q[r].pre:=l;
              end;
          if q[l].x=maxn then begin
              p:=l; findaugpath:=true;
              exit;
          end;
      end;
      findaugpath:=false;
  end;
 
 procedure augpath(k:longint);
  begin
      if q[k].pre<>0 then begin
          augpath(q[k].pre);
          if a[q[q[k].pre].x,q[k].x]>f[q[q[k].pre].x,q[k].x] then inc(f[q[q[k].pre].x,q[k].x],ans)
          	else dec(f[q[k].x,q[q[k].pre].x],ans);
      end;
  end;
  
 begin
     fillchar(q,sizeof(q),0);
     while findaugpath do begin
         ans:=q[p].aug;
         augpath(p);
     end;
 end;

procedure print;
 var i,j:longint;
 begin
     for i:=10 to 12 do w[i-9]:=w[i-9]-f[i,13]*2;
     if f[10,13]+f[11,13]+f[12,13]+w[1]+w[2]+w[3]>n then begin
         writeln('no solution');
         exit;                    
     end;
     for i:=1 to n do
     	if f[1,flag[i]+1]>0 then begin
            dec(f[1,flag[i]+1]);
            for j:=10 to 12 do
                if f[flag[i]+1,j]>0 then begin
                    write(name[j-9]);
                    dec(f[flag[i]+1,j]);
                    break;
                end;
         end else begin
             if w[1]>0 then begin
                dec(w[1]);
                write(name[1]);
             end else if w[2]>0 then begin
                dec(w[2]);
                write(name[2]);
             end else begin
                 dec(w[3]);
                 write(name[3]);
             end;
         end;  
     writeln;
 end;



begin
    buildmap;
    netflow;
    print;
end.