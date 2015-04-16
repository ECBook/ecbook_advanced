<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "person".
 *
 * @property string $p_nachname
 * @property string $p_vorname
 * @property string $p_geburtsdatum
 * @property string $p_wohnort
 * @property string $p_plz
 * @property string $p_wohnadresse
 * @property string $p_telefonnummer
 * @property string $p_l_benutzername
 * @property string $p_l_passwort
 * @property integer $bg_id
 *
 * @property Eltern[] $elterns
 * @property Lehrer[] $lehrers
 * @property Benutzergruppe $bg
 * @property Schueler[] $schuelers
 */
class Person extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'person';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['p_nachname', 'p_vorname', 'p_geburtsdatum', 'p_l_benutzername', 'p_l_passwort', 'bg_id'], 'required'],
            [['p_geburtsdatum'], 'safe'],
            [['bg_id'], 'integer'],
            [['p_nachname', 'p_vorname', 'p_wohnort', 'p_plz', 'p_wohnadresse', 'p_telefonnummer', 'p_l_benutzername', 'p_l_passwort'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'p_nachname' => 'P Nachname',
            'p_vorname' => 'P Vorname',
            'p_geburtsdatum' => 'P Geburtsdatum',
            'p_wohnort' => 'P Wohnort',
            'p_plz' => 'P Plz',
            'p_wohnadresse' => 'P Wohnadresse',
            'p_telefonnummer' => 'P Telefonnummer',
            'p_l_benutzername' => 'P L Benutzername',
            'p_l_passwort' => 'P L Passwort',
            'bg_id' => 'Bg ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getElterns()
    {
        return $this->hasMany(Eltern::className(), ['e_nachname' => 'p_nachname', 'e_vorname' => 'p_vorname', 'e_geburtsdatum' => 'p_geburtsdatum']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLehrers()
    {
        return $this->hasMany(Lehrer::className(), ['l_nachname' => 'p_nachname', 'l_vorname' => 'p_vorname', 'l_geburtsdatum' => 'p_geburtsdatum']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBg()
    {
        return $this->hasOne(Benutzergruppe::className(), ['bg_id' => 'bg_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSchuelers()
    {
        return $this->hasMany(Schueler::className(), ['s_nachname' => 'p_nachname', 's_vorname' => 'p_vorname', 's_geburtsdatum' => 'p_geburtsdatum']);
    }
}
