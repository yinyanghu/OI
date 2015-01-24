program ural1102;
var
  n,i:word;
function ok:boolean;
  var
    s{status -- stem at the end of the string}:byte;
    c:char;
  begin
    ok:=false;s:=0;
    while not eoln do begin
      read(c);
      case s of
        0 {        }:case c of 'i':s:=1;'o':s:=2;'p':s:=3;else exit;end;
        1 {i       }:case c of 'n':s:=4;else exit;end;
        2 {o       }:case c of 'n':s:=5;'u':s:=6;else exit;end;
        3 {p       }:case c of 'u':s:=7;else exit;end;
        4 {in      }:case c of 'i':s:=1;'o':s:=2;'p':s:=8;else exit;end;
        5 {on      }:case c of 'e':s:=0;else exit;end;
        6 {ou      }:case c of 't':s:=9;else exit;end;
        7 {pu      }:case c of 't':s:=10;else exit;end;
        8 {(in)p   }:case c of 'u':s:=11;else exit;end;
        9 {out     }:case c of 'i':s:=1;'o':s:=2;'p':s:=12;else exit;end;
        10{put     }:case c of 'o':s:=13;else exit;end;
        11{(in)pu  }:case c of 't':s:=15;else exit;end;
        12{(out)p  }:case c of 'u':s:=16;else exit;end;
        13{puto    }:case c of 'n':s:=0;else exit;end;
        14{(put)o  }:case c of 'n':s:=17;'u':s:=6;else exit;end;
        15{(in)put }:case c of 'i':s:=1;'o':s:=14;'p':s:=3;else exit;end;
        16{(out)pu }:case c of 't':s:=18;else exit;end;
        17{(put)on }:case c of 'e':s:=0;'i':s:=1;'o':s:=2;'p':s:=3;else exit;end;
        18{(out)put}:case c of 'i':s:=1;'o':s:=14;'p':s:=3;else exit;end;
        {Brackets contain the stems that can be interpreted either
         as the head or the end of a word}
      end;
    end;
    case s of
      0,4,9,15,17,18:ok:=true;
    end;
  end;
begin
  readln(n);
  for i:=1 to n do begin
    if ok then writeln('YES') else writeln('NO');
    readln;
  end;
end.
