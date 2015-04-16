<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "benutzergruppe".
 *
 * @property integer $bg_id
 * @property string $bg_name
 *
 * @property Person[] $people
 */
class Benutzergruppe extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'benutzergruppe';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['bg_id'], 'required'],
            [['bg_id'], 'integer'],
            [['bg_name'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'bg_id' => 'Bg ID',
            'bg_name' => 'Bg Name',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPeople()
    {
        return $this->hasMany(Person::className(), ['bg_id' => 'bg_id']);
    }
}
