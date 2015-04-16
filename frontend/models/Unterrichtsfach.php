<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "unterrichtsfach".
 *
 * @property string $uf_bezeichnung
 * @property string $uf_kurzbezeichnung
 * @property string $uf_jahrgang
 * @property integer $uf_stundenanzahlprowoche
 *
 * @property Fehlstunde[] $fehlstundes
 * @property Unterrichtsstunde[] $unterrichtsstundes
 */
class Unterrichtsfach extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'unterrichtsfach';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uf_bezeichnung', 'uf_kurzbezeichnung'], 'required'],
            [['uf_stundenanzahlprowoche'], 'integer'],
            [['uf_bezeichnung', 'uf_kurzbezeichnung', 'uf_jahrgang'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'uf_bezeichnung' => 'Uf Bezeichnung',
            'uf_kurzbezeichnung' => 'Uf Kurzbezeichnung',
            'uf_jahrgang' => 'Uf Jahrgang',
            'uf_stundenanzahlprowoche' => 'Uf Stundenanzahlprowoche',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFehlstundes()
    {
        return $this->hasMany(Fehlstunde::className(), ['uf_bezeichnung' => 'uf_bezeichnung']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUnterrichtsstundes()
    {
        return $this->hasMany(Unterrichtsstunde::className(), ['uf_bezeichnung' => 'uf_bezeichnung']);
    }
}
