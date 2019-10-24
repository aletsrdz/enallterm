<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%equipo}}".
 *
 * @property int $id
 * @property string $nombre
 * @property int $grupo_id
 *
 * @property Grupo $grupo
 * @property Inscrito[] $inscritos
 */
class Equipo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%equipo}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre', 'grupo_id'], 'required'],
            [['grupo_id'], 'default', 'value' => null],
            [['grupo_id'], 'integer'],
            [['nombre'], 'string', 'max' => 100],
            [['grupo_id'], 'exist', 'skipOnError' => true, 'targetClass' => Grupo::className(), 'targetAttribute' => ['grupo_id' => 'id']],
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
            'grupo_id' => 'Grupo ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGrupo()
    {
        return $this->hasOne(Grupo::className(), ['id' => 'grupo_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInscritos()
    {
        return $this->hasMany(Inscrito::className(), ['equipo_id' => 'id']);
    }
}
