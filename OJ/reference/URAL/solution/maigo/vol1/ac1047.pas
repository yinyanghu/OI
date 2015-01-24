{Because a[i]=(a[i-1]+a[i+1])/2-c[i],
 therefore 2*a[i]+2*c[i]=a[i-1]+a[i+1].

 Let i be every integer between 1 and n inclusive, we have n formulae.
 Adding all them together, we obtain
   a[1]+a[n]+2*(c[1]+c[2]+...+c[n])=a[0]+a[n+1].

 Denote c[1]+c[2]+...+c[n] by b[n],
 then it becomes a[1]+a[n]+2*b[n]=a[0]+a[n+1].

 Let n vary from 1 to n inclusive, we have another n formulae.
 Adding all them together, we obtain
   n*a[1]+a[1]+2*(b[1]+b[2]+...+b[n])=n*a[0]+a[n+1],
 i.e.
   a[1]=(n*a[0]+a[n+1]-2*(b[1]+b[2]+...+b[n]))/(n+1).
}
program ural1047;
var
  n,i:integer;
  a0,anp1,c,csum,bsum:real;
begin
  read(n,a0,anp1);
  csum:=0;bsum:=0;
  for i:=1 to n do begin
    read(c);
    csum:=csum+c;
    bsum:=bsum+csum;
  end;
  writeln((n*a0+anp1-2*bsum)/(n+1):0:2);
end.
