program bowling;
var s:string;
    ball:array[1..100,1..2] of integer;
    es:array[1..100] of integer;
    i,j,k,m,n,p,t,total:longint;
begin
    readln(s);
    fillchar(ball,sizeof(ball),0);
    i:=1; j:=1;
    while i<=length(s) do begin
        while s[i]=' ' do inc(i);
        if (s[i]='/') and (ball[j,1]=0) then begin
            ball[j,1]:=10;
            inc(i); inc(j);
        end else if (s[i]='/') and (ball[j,1]<>0) then begin
            ball[j,2]:=10-ball[j,1];
            inc(i); inc(j);
        end else begin
            if ball[j,1]=0 then begin
                ball[j,1]:=ord(s[i])-ord('0');
                inc(i);
            end else begin
                ball[j,2]:=ord(s[i])-ord('0');
                inc(i); inc(j);
            end;
        end;
    end;
    fillchar(es,sizeof(es),0);
    m:=j-1;
    for i:=1 to m do begin
        if ball[i,1]=10 then begin
            t:=1;
            es[i]:=es[i]+10;
            p:=i+1;
            while (t<3) and (p+1<=m) do begin
                if (ball[p,1]=10) then begin
                    es[i]:=es[i]+ball[p,1];
                    inc(p);
                    inc(t);
                end;
                if (ball[p,1]+ball[p,2]=10) and (ball[p,1]<10) and (t=1) then begin
                    es[i]:=es[i]+10;
                    t:=t+2;
                end else if (ball[p,1]+ball[p,2]=10) and (ball[p,1]<10) and (t=2) then begin
                    es[i]:=es[i]+ball[p,1];
                    inc(t);
                end;
                if (ball[p,1]+ball[p,2]<10) and (t=1) then begin
                    es[i]:=es[i]+ball[p,1]+ball[p,2];
                    t:=t+2;
                end else if t=2 then begin
                    es[i]:=es[i]+ball[p,1];
                    inc(t);
                end;
             end;
                if (t<3) or (es[i]<=10) then es[i]:=-1;
            end else begin
                if (ball[i,1]+ball[i,2]=10) and (i+1<=m) then begin
                    es[i]:=es[i]+10+ball[i+1,1];
                end;
                if  ball[i,1]+ball[i,2]<10 then begin
                    es[i]:=es[i]+ball[i,1]+ball[i,2];
                end;
            end;
        end;
    for i:=1 to m do if es[i]>0 then write(es[i],'    ');
    writeln;
    total:=0;
    for i:=1 to m do begin
        if es[i]>0 then begin
            total:=total+es[i];
            write(total,'    ');
        end;
    end;
end.