<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%subareas}}".
 *
 * @property int $id
 * @property int $areas_id
 * @property string $nombre
 *
 * @property FichaTerminologica[] $fichaTerminologicas
 * @property Area $areas
 */
class Subareas extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%subareas}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['areas_id', 'nombre'], 'required'],
            [['areas_id'], 'default', 'value' => null],
            [['areas_id'], 'integer'],
            [['nombre'], 'string', 'max' => 250],
            [['areas_id'], 'exist', 'skipOnError' => true, 'targetClass' => Areas::className(), 'targetAttribute' => ['areas_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'areas_id' => 'Areas ID',
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
    public function getAreas()
    {
        return $this->hasOne(Areas::className(), ['id' => 'areas_id']);
    }
}
