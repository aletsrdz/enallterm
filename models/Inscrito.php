<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%inscrito}}".
 *
 * @property int $id
 * @property int $user_id
 * @property int $materia_id
 * @property int $grupo_id
 * @property int $equipo_id
 *
 * @property Autor[] $autors
 * @property Equipo $equipo
 * @property Grupo $grupo
 * @property Materia $materia
 * @property User $user
 */
class Inscrito extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%inscrito}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'materia_id', 'grupo_id', 'equipo_id'], 'required'],
            [['user_id', 'materia_id', 'grupo_id', 'equipo_id'], 'default', 'value' => null],
            [['user_id', 'materia_id', 'grupo_id', 'equipo_id'], 'integer'],
            [['user_id', 'materia_id'], 'unique', 'targetAttribute' => ['user_id', 'materia_id']],
            [['equipo_id'], 'exist', 'skipOnError' => true, 'targetClass' => Equipo::className(), 'targetAttribute' => ['equipo_id' => 'id']],
            [['grupo_id'], 'exist', 'skipOnError' => true, 'targetClass' => Grupo::className(), 'targetAttribute' => ['grupo_id' => 'id']],
            [['materia_id'], 'exist', 'skipOnError' => true, 'targetClass' => Materia::className(), 'targetAttribute' => ['materia_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'materia_id' => 'Materia ID',
            'grupo_id' => 'Grupo ID',
            'equipo_id' => 'Equipo ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAutors()
    {
        return $this->hasMany(Autor::className(), ['inscrito_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEquipo()
    {
        return $this->hasOne(Equipo::className(), ['id' => 'equipo_id']);
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
    public function getMateria()
    {
        return $this->hasOne(Materia::className(), ['id' => 'materia_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
