array: boxed_column { label = "<배치>";
    
  : radio_button { label = "단일 홀"; key = "single"; value = "1"; }
  : radio_button { label = "다중 홀"; key = "multiple"; }
}

holeType: column {
    
  : radio_button { label = "탭"; key = "tap"; value = 1;}
  : radio_button { label = "드릴"; key = "drillHole"; }
  : radio_button { label = "카운터보어"; key = "counterBore"; }
  : radio_button { label = "카운터싱크"; key = "counterSink"; }
  // : radio_button { label = "장공"; key = "slot"; }
}

view: boxed_column { label = "<투상>";
  
  : radio_button { label = "평면도"; key = "topView"; value = 1; }
  : radio_button { label = "단면도"; key = "sectionView"; }
}

tapSize: popup_list { key = "tapSize"; }

centerLine: toggle { label = "중심선"; key = "centerLine"; value = 1; }

slot: toggle { label = "장공"; key = "slot"; }

// //////////////////////////////////////////////////////////

holeDialog: dialog { label = "구멍";

  : boxed_row { label = "구명 유형";
    
    holeType;
    tapSize;
  }

  : row {
    array;
    view;
  }


  : row {
    centerLine;
    slot;
  }

  ok_cancel;
}