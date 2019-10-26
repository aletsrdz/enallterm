<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%paises}}".
 *
 * @property int $id
 * @property string $nombre
 * @property string $abreviatura
 *
 * @property FichaTerminologica[] $fichaTerminologicas
 */
class Paises extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%paises}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'abreviatura'], 'required'],
            [['nombre'], 'string', 'max' => 100],
            [['abreviatura'], 'string', 'max' => 50],
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
            'abreviatura' => 'Abreviatura',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFichaTerminologicas()
    {
        return $this->hasMany(FichaTerminologica::className(), ['pais_id' => 'id']);
    }
}
