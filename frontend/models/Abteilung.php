<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "abteilung".
 *
 * @property string $abt_bezeichnung
 * @property string $abt_kuerzel
 * @property string $abt_vorstand
 * @property integer $l_lehrerid
 *
 * @property Lehrer $lLehrer
 * @property Klasse[] $klasses
 */
class Abteilung extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'abteilung';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['abt_bezeichnung', 'abt_kuerzel', 'l_lehrerid'], 'required'],
            [['l_lehrerid'], 'integer'],
            [['abt_bezeichnung', 'abt_kuerzel', 'abt_vorstand'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'abt_bezeichnung' => 'Abt Bezeichnung',
            'abt_kuerzel' => 'Abt Kuerzel',
            'abt_vorstand' => 'Abt Vorstand',
            'l_lehrerid' => 'L Lehrerid',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLLehrer()
    {
        return $this->hasOne(Lehrer::className(), ['l_lehrerid' => 'l_lehrerid']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKlasses()
    {
        return $this->hasMany(Klasse::className(), ['k_abt_bezeichnung' => 'abt_bezeichnung']);
    }
}
