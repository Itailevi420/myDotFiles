/* A standard layout for the Dactyl Manuform 5x6 Keyboard */

#include QMK_KEYBOARD_H


#define _COLMAK 0
#define _QWERTY 1
#define _LOWER 2
#define _RAISE 3
#define _SWITCH 4

#define RAISE TG(_RAISE)
#define LOWER1 TG(_LOWER)
#define LOWER MO(_LOWER)
#define SWITCH MO(_SWITCH)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

  [_COLMAK] = LAYOUT_5x6(
     KC_GRV ,        KC_1  , KC_2  , KC_3  , KC_4  , KC_5  ,                  KC_6  , KC_7  , KC_8  , KC_9  , KC_0  ,KC_BSPC,
     KC_TAB ,        KC_Q  , KC_W  , KC_F  , KC_P  , KC_G  ,                  KC_J  , KC_L  , KC_U  , KC_Y  , KC_SCLN , KC_MINS,
     LCTL_T(KC_ESC), KC_A  , KC_R  , KC_S  , KC_T  , KC_D  ,                  KC_H  , KC_N  , KC_E  , KC_I  ,KC_O, KC_QUOT,
     KC_LSFT, KC_Z  , KC_X  , KC_C  , KC_V  , KC_B  ,                         KC_K  , KC_M  ,KC_COMM,KC_DOT ,KC_SLSH,RSFT_T(KC_BSLASH),
                      KC_LBRC, KC_RBRC,                                                               LOWER1, KC_EQL,
                                      KC_SPC,KC_BSPC,                         LT(_RAISE,KC_ENT),KC_SPC,
                                      KC_LGUI,KC_LALT,                        KC_RALT, LOWER,
                                      LT(_SWITCH,KC_ENT), KC_LCTL,            KC_RCTL , KC_LGUI
  ),

  [_QWERTY] = LAYOUT_5x6(
     KC_GRV , KC_1  , KC_2  , KC_3  , KC_4  , KC_5  ,                         KC_6  , KC_7  , KC_8  , KC_9  , KC_0  ,KC_BSPC,
     KC_TAB , KC_Q  , KC_W  , KC_E  , KC_R  , KC_T  ,                         KC_Y  , KC_U  , KC_I  , KC_O  , KC_P  ,KC_MINS,
     LCTL_T(KC_ESC), KC_A  , KC_S  , KC_D  , KC_F  , KC_G  ,                  KC_H  , KC_J  , KC_K  , KC_L  ,KC_SCLN,KC_QUOT,
     KC_LSFT, KC_Z  , KC_X  , KC_C  , KC_V  , KC_B  ,                         KC_N  , KC_M  ,KC_COMM,KC_DOT ,KC_SLSH,RSFT_T(KC_BSLASH),
                      KC_LBRC, KC_RBRC,                                                               LOWER1, KC_EQL,
                                      KC_SPC,KC_BSPC,                         LT(_RAISE,KC_ENT),KC_SPC,
                                      KC_LGUI,KC_LALT,                        KC_RALT, LOWER,
                                      LT(_SWITCH,KC_ENT), KC_LCTL,            KC_RCTL , KC_LGUI
  ),

  [_LOWER] = LAYOUT_5x6(
     KC_TILD,KC_EXLM, KC_AT ,KC_HASH,KC_DLR ,KC_PERC,                         KC_CIRC,KC_AMPR,KC_ASTR,KC_LPRN,KC_RPRN,KC_DEL,
     _______ ,KC_NO,KC_NO,KC_NO,KC_NO,KC_LBRC,                                 KC_RBRC, KC_P7 , KC_P8 , KC_P9 ,KC_NO,KC_PLUS,
     _______ ,KC_HOME,KC_PGUP,KC_PGDN,KC_END ,KC_LPRN,                         KC_RPRN, KC_P4 , KC_P5 , KC_P6 ,KC_MINS,KC_PIPE,
     _______ ,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,                                   KC_NO, KC_P1 , KC_P2 , KC_P3 ,KC_EQL ,KC_UNDS,
                      _______,_______,                                                        _______, _______,
                                             _______,_______,            _______,_______,
                                             _______,_______,            _______,_______,
                                             _______,_______,            _______,_______

  ),

  [_RAISE] = LAYOUT_5x6(
       KC_F12 , KC_F1 , KC_F2 , KC_F3 , KC_F4 , KC_F5 ,                        KC_F6  , KC_F7 , KC_F8 , KC_F9 ,KC_F10 ,KC_F11,
       _______,KC_NO,KC_NO,KC_NO,KC_NO,KC_LBRC,                                KC_RBRC,KC_PSCR,KC_NLCK,KC_INS ,KC_SLCK,KC_MUTE,
       _______,KC_NO,KC_NO,KC_NO,KC_NO,KC_NO,                                  KC_LEFT,KC_DOWN,KC_UP  ,KC_RGHT,KC_NO,KC_VOLU,
       _______,KC_MPRV,KC_MPLY,KC_MNXT,KC_NO,KC_LPRN,                          KC_RPRN,KC_NO,KC_NO,KC_NO,KC_NO,KC_VOLD,
                       _______,_______,                                                       _______ ,_______,
                                               _______,_______,            _______,_______,
                                               _______,_______,            _______,_______,
                                               _______,_______,            _______,_______
  ),
 [_SWITCH] = LAYOUT_5x6(
     KC_GRV , KC_1  , KC_2  , KC_3  , KC_4  , KC_5  ,                            KC_6  , KC_7  , KC_8  , KC_9  , KC_0  ,KC_BSPC,
     KC_TAB , KC_NO  , KC_NO  , KC_NO  , KC_NO  , KC_NO,                         KC_NO  , KC_NO  , KC_NO  , KC_NO  , KC_NO  ,KC_NO,
     LCTL_T(KC_ESC), KC_NO, TG(3), TG(2), TG(1), TG(0),                          KC_NO  , KC_NO  , KC_NO  , KC_NO  ,KC_NO,KC_NO,
     KC_NO, KC_NO  , KC_NO  , KC_NO  , KC_NO  , KC_NO,                           KC_NO  , KC_NO  ,KC_NO,KC_NO ,KC_NO,RSFT_T(KC_BSLASH),
                      _______,_______,                                                       _______, _______,
                                      _______,_______,                        _______, _______,
                                      _______,_______,                         _______,  _______,
                                      _______, _______,                        _______, _______

        ),
};

