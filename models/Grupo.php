<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%grupo}}".
 *
 * @property int $id
 * @property string $nombre
 * @property int $materia_id
 *
 * @property Equipo[] $equipos
 * @property Materium $materia
 * @property Inscrito[] $inscritos
 */
class Grupo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%grupo}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'materia_id'], 'required'],
            [['materia_id'], 'default', 'value' => null],
            [['materia_id'], 'integer'],
            [['nombre'], 'string', 'max' => 100],
            [['materia_id'], 'exist', 'skipOnError' => true, 'targetClass' => Materia::className(), 'targetAttribute' => ['materia_id' => 'id']],
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
            'materia_id' => 'Materia ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEquipos()
    {
        return $this->hasMany(Equipo::className(), ['grupo_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMateria()
    {
        return $this->hasOne(Materium::className(), ['id' => 'materia_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInscritos()
    {
        return $this->hasMany(Inscrito::className(), ['grupo_id' => 'id']);
    }
}
