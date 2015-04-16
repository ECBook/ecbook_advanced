<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "lehrer".
 *
 * @property integer $l_lehrerid
 * @property integer $l_istklassenvorstand
 * @property string $l_nachname
 * @property string $l_vorname
 * @property string $l_geburtsdatum
 *
 * @property Abteilung[] $abteilungs
 * @property Person $lNachname
 * @property Unterrichtsstunde[] $unterrichtsstundes
 */
class Lehrer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'lehrer';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['l_lehrerid', 'l_istklassenvorstand', 'l_nachname', 'l_vorname', 'l_geburtsdatum'], 'required'],
            [['l_lehrerid', 'l_istklassenvorstand'], 'integer'],
            [['l_geburtsdatum'], 'safe'],
            [['l_nachname', 'l_vorname'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'l_lehrerid' => 'L Lehrerid',
            'l_istklassenvorstand' => 'L Istklassenvorstand',
            'l_nachname' => 'L Nachname',
            'l_vorname' => 'L Vorname',
            'l_geburtsdatum' => 'L Geburtsdatum',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAbteilungs()
    {
        return $this->hasMany(Abteilung::className(), ['l_lehrerid' => 'l_lehrerid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLNachname()
    {
        return $this->hasOne(Person::className(), ['p_nachname' => 'l_nachname', 'p_vorname' => 'l_vorname', 'p_geburtsdatum' => 'l_geburtsdatum']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUnterrichtsstundes()
    {
        return $this->hasMany(Unterrichtsstunde::className(), ['l_lehrerid' => 'l_lehrerid']);
    }
}
