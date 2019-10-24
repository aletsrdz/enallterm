<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%materia}}".
 *
 * @property int $id
 * @property string $nombre
 *
 * @property Grupo[] $grupos
 * @property Inscrito[] $inscritos
 * @property User[] $users
 */
class Materia extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%materia}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre'], 'required'],
            [['nombre'], 'string', 'max' => 100],
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
    public function getGrupos()
    {
        return $this->hasMany(Grupo::className(), ['materia_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInscritos()
    {
        return $this->hasMany(Inscrito::className(), ['materia_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'user_id'])->viaTable('{{%inscrito}}', ['materia_id' => 'id']);
    }
}
