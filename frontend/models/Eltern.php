<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "eltern".
 *
 * @property string $e_id
 * @property string $e_nachname
 * @property string $e_vorname
 * @property string $e_geburtsdatum
 *
 * @property Person $eNachname
 * @property Schueler[] $schuelers
 */
class Eltern extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'eltern';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['e_id', 'e_nachname', 'e_vorname', 'e_geburtsdatum'], 'required'],
            [['e_geburtsdatum'], 'safe'],
            [['e_id', 'e_nachname', 'e_vorname'], 'string', 'max' => 45]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'e_id' => 'E ID',
            'e_nachname' => 'E Nachname',
            'e_vorname' => 'E Vorname',
            'e_geburtsdatum' => 'E Geburtsdatum',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getENachname()
    {
        return $this->hasOne(Person::className(), ['p_nachname' => 'e_nachname', 'p_vorname' => 'e_vorname', 'p_geburtsdatum' => 'e_geburtsdatum']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSchuelers()
    {
        return $this->hasMany(Schueler::className(), ['e_id' => 'e_id']);
    }
}
