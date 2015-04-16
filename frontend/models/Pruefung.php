<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pruefung".
 *
 * @property string $p_datum
 * @property string $p_uhrzeit
 * @property integer $uf_id
 *
 * @property Unterrichtsstunde $uf
 */
class Pruefung extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'pruefung';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['p_datum', 'uf_id'], 'required'],
            [['p_datum'], 'safe'],
            [['uf_id'], 'integer'],
            [['p_uhrzeit'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'p_datum' => 'P Datum',
            'p_uhrzeit' => 'P Uhrzeit',
            'uf_id' => 'Uf ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUf()
    {
        return $this->hasOne(Unterrichtsstunde::className(), ['us_id' => 'uf_id']);
    }
}
