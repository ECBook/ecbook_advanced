<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "unterrichtsstunde".
 *
 * @property integer $us_id
 * @property string $us_std_datum
 * @property integer $us_stunde
 * @property string $us_kurzbezeichnung
 * @property string $us_raum
 * @property string $us_thema
 * @property string $k_name
 * @property integer $l_lehrerid
 * @property string $uf_bezeichnung
 *
 * @property Pruefung[] $pruefungs
 * @property Lehrer $lLehrer
 * @property Unterrichtsfach $ufBezeichnung
 * @property Klasse $kName
 */
class Unterrichtsstunde extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'unterrichtsstunde';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['us_id', 'us_std_datum', 'us_stunde', 'us_kurzbezeichnung', 'us_raum', 'k_name', 'l_lehrerid', 'uf_bezeichnung'], 'required'],
            [['us_id', 'us_stunde', 'l_lehrerid'], 'integer'],
            [['us_std_datum'], 'safe'],
            [['us_kurzbezeichnung', 'us_raum', 'us_thema', 'k_name', 'uf_bezeichnung'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'us_id' => 'Us ID',
            'us_std_datum' => 'Us Std Datum',
            'us_stunde' => 'Us Stunde',
            'us_kurzbezeichnung' => 'Us Kurzbezeichnung',
            'us_raum' => 'Us Raum',
            'us_thema' => 'Us Thema',
            'k_name' => 'K Name',
            'l_lehrerid' => 'L Lehrerid',
            'uf_bezeichnung' => 'Uf Bezeichnung',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPruefungs()
    {
        return $this->hasMany(Pruefung::className(), ['uf_id' => 'us_id']);
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
    public function getUfBezeichnung()
    {
        return $this->hasOne(Unterrichtsfach::className(), ['uf_bezeichnung' => 'uf_bezeichnung']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKName()
    {
        return $this->hasOne(Klasse::className(), ['k_name' => 'k_name']);
    }
}
