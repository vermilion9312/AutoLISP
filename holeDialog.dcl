holeDialog : dialog { label = "����";

  : boxed_column { label = "<��ġ>";
    
    : radio_button { label = "���� Ȧ"; key = "single"; value = "1"; }
    : radio_button { label = "���� Ȧ"; key = "multiple"; }
  }

  spacer;

  : boxed_column { label = "<���� ����>";
    
    : radio_button { label = "��"; key = "tap"; value = 1;}
    : radio_button { label = "�帱"; key = "drillHole"; }
    : radio_button { label = "ī���ͺ���"; key = "counterBore"; }
    : radio_button { label = "ī���ͽ�ũ"; key = "counterSink"; }
    // : radio_button { label = "���"; key = "slot"; }
  }

  spacer;

  : boxed_column { label = "<����>";
    
    : radio_button { label = "��鵵"; key = "topView"; value = 1; }
    : radio_button { label = "�ܸ鵵"; key = "sectionView"; }
  }

  spacer;

  : popup_list { label = "�� ������: "; key = "tapSize"; }

  spacer;

  : toggle { label = "�߽ɼ�"; key = "centerLine"; value = 1; }
  : toggle { label = "���"; key = "slot"; }


  ok_cancel;
}