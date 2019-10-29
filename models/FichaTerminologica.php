<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%ficha_terminologica}}".
 *
 * @property int $id
 * @property int $area_id
 * @property int $subarea_id
 * @property int $pais_id
 * @property string $temino_origen
 * @property string $termino_meta
 * @property string $definicion_origen
 * @property string $definicion_meta
 * @property string $fuente_origen
 * @property string $fuente_meta
 * @property string $contexto_origen
 * @property string $contexto_meta
 * @property string $no_recomendado
 * @property string $notas_fichat
 * @property string $url_imagen
 * @property string $url_video
 * @property string $url_sonido
 * @property string $create_at
 * @property string $update_at
 *
 * @property Autor[] $autors
 * @property User[] $users
 * @property Area $area
 * @property Paise $pais
 * @property Subarea $area0
 */
class FichaTerminologica extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%ficha_terminologica}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['area_id', 'subarea_id', 'pais_id'], 'default', 'value' => null],
            [['area_id', 'subarea_id', 'pais_id'], 'integer'],
            [['temino_origen', 'termino_meta', 'definicion_origen', 'definicion_meta'], 'required'],
            [['temino_origen', 'termino_meta', 'definicion_origen', 'definicion_meta', 'fuente_origen', 'fuente_meta', 'contexto_origen', 'contexto_meta', 'no_recomendado', 'notas_fichat'], 'string'],
            [['create_at', 'update_at'], 'safe'],
            //[['image'], 'file', 'skipOnEmpty'=>false, 'extensions'=>'jpg,png,gif'],
            [['url_imagen'], 'file', 'extensions'=>'jpg,png,gif'],
            [[ 'url_video', 'url_sonido'], 'string', 'max' => 255],
            [['area_id'], 'exist', 'skipOnError' => true, 'targetClass' => Areas::className(), 'targetAttribute' => ['area_id' => 'id']],
            [['pais_id'], 'exist', 'skipOnError' => true, 'targetClass' => Paises::className(), 'targetAttribute' => ['pais_id' => 'id']],
            [['area_id'], 'exist', 'skipOnError' => true, 'targetClass' => Subareas::className(), 'targetAttribute' => ['area_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'area_id' => 'Area ID',
            'subarea_id' => 'Subarea ID',
            'pais_id' => 'Pais ID',
            'temino_origen' => 'Temino Origen',
            'termino_meta' => 'Termino Meta',
            'definicion_origen' => 'Definicion Origen',
            'definicion_meta' => 'Definicion Meta',
            'fuente_origen' => 'Fuente Origen',
            'fuente_meta' => 'Fuente Meta',
            'contexto_origen' => 'Contexto Origen',
            'contexto_meta' => 'Contexto Meta',
            'no_recomendado' => 'No Recomendado',
            'notas_fichat' => 'Notas Fichat',
            'url_imagen' => 'Url Imagen',
            'url_video' => 'Url Video',
            'url_sonido' => 'Url Sonido',
            'create_at' => 'Create At',
            'update_at' => 'Update At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAutors()
    {
        return $this->hasMany(Autor::className(), ['ficha_terminologica_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'user_id'])->viaTable('{{%autor}}', ['ficha_terminologica_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArea()
    {
        return $this->hasOne(Areas::className(), ['id' => 'area_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPais()
    {
        return $this->hasOne(Paises::className(), ['id' => 'pais_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubarea()
    {
        return $this->hasOne(Subareas::className(), ['id' => 'area_id']);
    }
}
