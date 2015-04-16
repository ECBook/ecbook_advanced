<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "krankmeldung".
 *
 * @property integer $km_id
 * @property string $km_datum
 * @property string $km_unterschrift
 * @property integer $s_schuelernummer
 *
 * @property Schueler $sSchuelernummer
 */
class Krankmeldung extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'krankmeldung';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['km_id', 's_schuelernummer'], 'required'],
            [['km_id', 's_schuelernummer'], 'integer'],
            [['km_datum'], 'safe'],
            [['km_unterschrift'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'km_id' => 'Km ID',
            'km_datum' => 'Km Datum',
            'km_unterschrift' => 'Km Unterschrift',
            's_schuelernummer' => 'S Schuelernummer',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSSchuelernummer()
    {
        return $this->hasOne(Schueler::className(), ['s_schuelernummer' => 's_schuelernummer']);
    }
}
