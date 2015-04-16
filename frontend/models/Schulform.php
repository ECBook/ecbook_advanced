<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "schulform".
 *
 * @property integer $schf_id
 * @property string $schf_zweig
 * @property integer $schf_modulanforderung
 *
 * @property Klasse[] $klasses
 */
class Schulform extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'schulform';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['schf_id', 'schf_modulanforderung'], 'required'],
            [['schf_id', 'schf_modulanforderung'], 'integer'],
            [['schf_zweig'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'schf_id' => 'Schf ID',
            'schf_zweig' => 'Schf Zweig',
            'schf_modulanforderung' => 'Schf Modulanforderung',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getKlasses()
    {
        return $this->hasMany(Klasse::className(), ['schf_id' => 'schf_id']);
    }
}
