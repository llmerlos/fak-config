let { tap, hold, macro, .. } = import "fak/keycode.ncl" in
let util = import "fak/util_functions.ncl" in

let kc = tap.reg.kc in
let ks = tap.reg.ks in
let md = hold.reg.mod in
let mt = tap.reg.mod in
let ms = tap.sticky.mod in
let MO = hold.reg.layer in
let TO = tap.layer.TO in
let me = tap.custom.media in
let fk = tap.custom.fak in

let XXXXXXXX = tap.none & hold.none in
let TTTTTTTT = tap.trans & hold.trans in

let _BASE   = 0 in
let _GAME   = 1 in
let _GNUM   = 2 in
let _RISE   = 3 in
let _LOWR   = 4 in
let _FUNC   = 5 in
let _AJST   = 6 in 

let macro_kvm = fun keycode =>
  let steps = [
    macro.tap mt.rctl,
    macro.tap mt.rctl,
    macro.tap keycode,
  ] in
  macro.make steps
in

let macro_qa = fun keycode =>
  let steps = [
    macro.tap keycode,
    macro.tap (TO _BASE),
  ] in
  macro.make steps
in

let qp = fun keycode =>
  let steps = [
    macro.tap keycode,
  ] in
  macro.make steps
in

let eu = fun keycode =>
  mt.ralt & keycode
in

let cu = {
  D_MUT = mt.lsft & mt.lctl & kc.F9,
  D_SIL = mt.lsft & mt.lctl & kc.F11,
  D_SHS = mt.lsft & mt.lctl & kc.F10,
  VD_L = mt.lgui & mt.lctl & kc.LEFT,
  VD_R = mt.lgui & mt.lctl & kc.RIGHT,
  VD_U = mt.lgui & kc.TAB,
  E_IEX = mt.ralt & kc.N1,
  E_IQM = mt.ralt & kc.SLSH,
  E_NN  = mt.ralt & kc.N,
  E_CC  = mt.ralt & kc.C,
  E_LL  = mt.ralt & mt.lsft & kc.SCLN,
  E_OF  = mt.ralt & kc.N2,
  E_OM  = mt.ralt & kc.N3,
  E_EUR = mt.ralt & kc.N5,
  E_PND = mt.ralt & kc.N4,
  E_DEG = mt.ralt & kc.SCLN,
  E_AOB = macro_qa (mt.ralt & kc.GRV),
  E_ATC = macro_qa (mt.ralt & kc.QUOT),
  E_ACF = macro_qa (mt.ralt & kc.N6),
  E_ADI = macro_qa (mt.ralt & mt.lsft & ks.DQUO),
  E_ATI = macro_qa (mt.ralt & mt.lsft & kc.GRV),
  E_SMT = macro_qa (mt.ralt & kc.M),
  E_SLI = macro_qa (mt.ralt & kc.BSLS),
  KVM1 = macro_kvm kc.N1,
  KVM2 = macro_kvm kc.N2,
  AF4 = mt.lalt & kc.F4
} in

let keymap = {
  conditional_layers = {
    "6" = [_RISE, _LOWR]
  },
  layers = [
    # BASE
    [
      kc.TAB,   kc.Q,     kc.W,     kc.E,     kc.R,     kc.T,           kc.Y,     kc.U,     kc.I,     kc.O,     kc.P,     kc.ENT,     
      md.lsft,  kc.A,     kc.S,     kc.D,     kc.F,     kc.G,           kc.H,     kc.J,     kc.K,     kc.L,     kc.SCLN,  kc.QUOT,     
      md.lctl,  kc.Z,     kc.X,     kc.C,     kc.V,     kc.B,           kc.N,     kc.M,     kc.COMM,  kc.DOT,   kc.SLSH,  md.lalt,     
                                    md.lgui,  kc.SPC,   MO _RISE,       MO _LOWR, kc.BSPC,  md.rsft,                     
    ],
    # GAME    
    [
      kc.TAB,   kc.Q,     kc.W,     kc.E,     kc.R,     kc.T,           kc.Y,     kc.U,     kc.I,     kc.O,     kc.P,     kc.ENT,     
      md.lsft,  kc.A,     kc.S,     kc.D,     kc.F,     kc.G,           kc.H,     kc.J,     kc.K,     kc.L,     kc.SCLN,  kc.QUOT,     
      md.lctl,  kc.Z,     kc.X,     kc.C,     kc.V,     kc.B,           kc.N,     kc.M,     kc.COMM,  kc.DOT,   kc.SLSH,  md.lgui,     
                                    md.lalt,  kc.SPC,   MO _GNUM,       MO _LOWR, kc.BSPC,  md.rsft,                    
    ],
    # GNUM
    [
      kc.ESC,   kc.N1,    TTTTTTTT, kc.N2,    kc.N3,    kc.N4,          TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, 
      TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, kc.UP,    kc.N5,          TTTTTTTT, cu.VD_L,  cu.VD_U,  cu.VD_R,  TTTTTTTT, TTTTTTTT,
      TTTTTTTT, MO _FUNC, kc.N6,    kc.LEFT,  kc.DOWN,  kc.RIGHT,       TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, TTTTTTTT, 
                                    TTTTTTTT, TTTTTTTT, MO _GNUM,       TTTTTTTT, TTTTTTTT, TTTTTTTT,                    
    ],
    # RISE
    [
      TTTTTTTT, cu.VD_L,  kc.HOME,  kc.UP,    kc.END,   cu.VD_U,        ks.CIRC,  ks.AMPR,  ks.ASTR,  ks.LPRN,  ks.RPRN,  TTTTTTTT,   
      TTTTTTTT, kc.ESC,   kc.LEFT,  kc.DOWN,  kc.RIGHT, cu.VD_R,   qp ks.LCBR,qp ks.RCBR,qp kc.LBRC,qp kc.RBRC,qp ks.COLN,qp ks.DQUO,     
      TTTTTTTT, MO _FUNC, kc.PGUP,qp cu.E_CC, kc.PGDN,  kc.DEL,    qp kc.BSLS,qp ks.PIPE,qp ks.LABK,qp ks.RABK,qp ks.QUES,TTTTTTTT,       
                                    TTTTTTTT, TTTTTTTT, MO _RISE,       MO _LOWR, TTTTTTTT, TTTTTTTT,                     
    ],
    # LOWR
    [
      TTTTTTTT, ks.EXLM,  ks.AT,    ks.HASH,  ks.DLR,   ks.PERC,        kc.COMM,  kc.N7,    kc.N8,    kc.N9,    cu.E_AOB, TTTTTTTT,   
      TTTTTTTT,ks.TILD,qp kc.MINS,qp ks.PLUS,qp kc.EQL, XXXXXXXX,       kc.DOT,   kc.N4,    kc.N5,    kc.N6,    kc.N0,    cu.E_ATC,    
      TTTTTTTT, kc.GRV,qp kc.SLSH,qp ks.ASTR,qp ks.UNDS,XXXXXXXX,    qp cu.E_NN,  kc.N1,    kc.N2,    kc.N3,    MO _FUNC, TTTTTTTT,   
                                    TTTTTTTT, TTTTTTTT, MO _RISE,       MO _LOWR, TTTTTTTT, TTTTTTTT,                     
    ],
    # FUNC
    [
      TTTTTTTT, fk.BOOT,  ms.lctl,  ms.lsft,  ms.rsft,  ms.rctl,        kc.F12,   kc.F7,    kc.F8,    kc.F9,    fk.BOOT,  TTTTTTTT, 
      TTTTTTTT, fk.REST,  ms.lgui,  ms.lalt,  ms.ralt,  ms.rgui,        kc.F11,   kc.F4,    kc.F5,    kc.F6,    fk.REST,  TTTTTTTT, 
      TTTTTTTT, XXXXXXXX, cu.KVM1,  cu.KVM2,  TO _BASE, TO _GAME,       kc.F10,   kc.F1,    kc.F2,    kc.F3,    XXXXXXXX, TTTTTTTT, 
                                    TTTTTTTT, TTTTTTTT, MO _RISE,       MO _LOWR, TTTTTTTT, TTTTTTTT,                 
    ],
    # AJST
    [
      TTTTTTTT, eu kc.N1, eu kc.N2, eu kc.N3, eu kc.N4, eu kc.N5,       eu kc.N6, eu kc.N7, eu kc.N8, eu kc.N9, eu kc.N0, TTTTTTTT,  
      TTTTTTTT, kc.CAPS,  me.VOLD,  me.MUTE,  me.VOLU,  XXXXXXXX,       kc.SCRL,  cu.D_SHS, cu.D_MUT, cu.D_SIL,eu ks.COLN,eu kc.SCLN, 
      TTTTTTTT, kc.NUBS,  me.PREV,  me.PLAY,  me.NEXT,  XXXXXXXX,       kc.PAUS,  kc.PSCR,  kc.INS,   kc.APP,  eu kc.SLSH,TTTTTTTT, 
                                    TTTTTTTT, TTTTTTTT, MO _RISE,       MO _LOWR, TTTTTTTT, TTTTTTTT, 
    ],
  ]
} in

keymap
