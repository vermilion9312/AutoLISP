holeDialog : dialog { label = "����";

  : boxed_column { label = "��ġ";
    
    : radio_button { label = "���� Ȧ"; key = "single"; value = "1"; }
    : radio_button { label = "���� Ȧ"; key = "multiple"; }
  }

  : boxed_column { label = "����";
    
    : radio_button { label = "��鵵"; key = "topView"; value = 1; }
    : radio_button { label = "�ܸ鵵"; key = "sectionView"; }
  }

  : boxed_column { label = "���� ����";
    
    : radio_button { label = "�ܼ�"; key = "simple"; value = 1; }
    : radio_button { label = "��"; key = "tap"; }
    : radio_button { label = "ī���ͺ���"; key = "counterBore"; }
    : radio_button { label = "ī���ͽ�ũ"; key = "counterSink"; }
    : radio_button { label = "���"; key = "slot"; }
  }

  : popup_list { label = "�� ������: "; key = "tapSize"; list = "M3\nM4\nM5"; }
  ok_cancel;
}