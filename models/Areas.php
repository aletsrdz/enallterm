<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%areas}}".
 *
 * @property int $id
 * @property string $nombre
 *
 * @property FichaTerminologica[] $fichaTerminologicas
 * @property Subarea[] $subareas
 */
class Areas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%areas}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['nombre'], 'string', 'max' => 250],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'nombre' => 'Nombre',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFichaTerminologicas()
    {
        return $this->hasMany(FichaTerminologica::className(), ['area_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubareas()
    {
        return $this->hasMany(Subarea::className(), ['areas_id' => 'id']);
    }
}
