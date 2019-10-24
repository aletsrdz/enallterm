<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%autor}}".
 *
 * @property int $id
 * @property int $ficha_terminologica_id
 * @property int $user_id
 * @property string $nombre
 * @property string $apaterno
 * @property string $amaterno
 * @property int $inscrito_id
 *
 * @property FichaTerminologica $fichaTerminologica
 * @property Inscrito $inscrito
 * @property User $user
 */
class Autor extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%autor}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['ficha_terminologica_id', 'user_id'], 'required'],
            [['ficha_terminologica_id', 'user_id', 'inscrito_id'], 'default', 'value' => null],
            [['ficha_terminologica_id', 'user_id', 'inscrito_id'], 'integer'],
            [['nombre', 'apaterno', 'amaterno'], 'string', 'max' => 255],
            [['ficha_terminologica_id', 'user_id'], 'unique', 'targetAttribute' => ['ficha_terminologica_id', 'user_id']],
            [['ficha_terminologica_id'], 'exist', 'skipOnError' => true, 'targetClass' => FichaTerminologica::className(), 'targetAttribute' => ['ficha_terminologica_id' => 'id']],
            [['inscrito_id'], 'exist', 'skipOnError' => true, 'targetClass' => Inscrito::className(), 'targetAttribute' => ['inscrito_id' => 'id']],
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
            'ficha_terminologica_id' => 'Ficha Terminologica ID',
            'user_id' => 'User ID',
            'nombre' => 'Nombre',
            'apaterno' => 'Apaterno',
            'amaterno' => 'Amaterno',
            'inscrito_id' => 'Inscrito ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFichaTerminologica()
    {
        return $this->hasOne(FichaTerminologica::className(), ['id' => 'ficha_terminologica_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInscrito()
    {
        return $this->hasOne(Inscrito::className(), ['id' => 'inscrito_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
