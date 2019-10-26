<?php
namespace app\commands;
use app\models\User;
use Yii;
use yii\console\Controller;
/**
* Class RbacController.
* @package app\commands
*/
class RbacController extends Controller
{
	 public function actionInit()
	 {
		 $auth= Yii::$app->authManager;
		 try{

		 	$auth->removeAll();	

		 	$createPais = $auth->createPermission('createPais');
		 	$createPais->description = 'Crear pais';
		 	$updatePais = $auth->createPermission('updatePais');
		 	$updatePais->description = 'Actualizar pais';
		 	$deletePais = $auth->createPermission('deletePais');
		 	$deletePais->description = 'Borrar pais';
		 	$readPais = $auth->createPermission('readPais');
		 	$readPais->description = 'Leer pais';

		 	$createAreas = $auth->createPermission('createAreas');
		 	$createAreas->description = 'Crear Areas';
		 	$updateAreas = $auth->createPermission('updateAreas');
		 	$updateAreas->description = 'Actualizar Areas';
		 	$deleteAreas = $auth->createPermission('deleteAreas');
		 	$deleteAreas->description = 'Borrar Areas';
		 	$readAreas = $auth->createPermission('readAreas');
		 	$readAreas->description = 'Leer Areas';

		 	$createSubareas = $auth->createPermission('createSubareas');
		 	$createSubareas->description = 'Crear Subareas';
		 	$updateSubareas = $auth->createPermission('updateSubareas');
		 	$updateSubareas->description = 'Actualizar Subareas';
		 	$deleteSubareas = $auth->createPermission('deleteSubareas');
		 	$deleteSubareas->description = 'Borrar Subareas';
		 	$readSubareas = $auth->createPermission('readSubareas');
		 	$readSubareas->description = 'Leer Subareas';

		 	//add permissions

		 	$auth->add($createPais);
		 	$auth->add($updatePais);
		 	$auth->add($deletePais);
		 	$auth->add($readPais);

		 	$auth->add($createAreas);
		 	$auth->add($updateAreas);
		 	$auth->add($deleteAreas);
		 	$auth->add($readAreas);

		 	$auth->add($createSubareas);
		 	$auth->add($updateSubareas);
		 	$auth->add($deleteSubareas);
		 	$auth->add($readSubareas);		 	

		 	//create Superadmin role

		 	$superadmin = $auth->createRole('super');
		 	$auth->add($superadmin);
		 	$auth->addChild($superadmin, $deletePais);
			$auth->addChild($superadmin, $deleteAreas);
			$auth->addChild($superadmin, $deleteSubareas);	

			//create Admin role

			$admin = $auth->createRole('admin');
			$auth->add($admin);

			$auth->addChild($superadmin, $admin); //admin es hijo de superadmin

			$auth->addChild($admin, $createPais);
			$auth->addChild($admin, $updatePais);	 			
			$auth->addChild($admin, $readPais);
			$auth->addChild($admin, $createAreas);
			$auth->addChild($admin, $updateAreas);	 			
			$auth->addChild($admin, $readAreas);			
			$auth->addChild($admin, $createSubareas);
			$auth->addChild($admin, $updateSubareas);	 			
			$auth->addChild($admin, $readSubareas);

		 	// permiso de crear usuario
		 	$createUser = $auth->createPermission('createuser');
		 	$createUser->description = 'Crear usuarios del sistema';
		 	$auth->add($createUser);
		 	$auth->addChild($admin, $createUser);
		 	// permiso de editar usuario
		 	$updateUser = $auth->createPermission('updateuser');
		 	$updateUser->description = 'Editar usuarios del sistema';
		 	$auth->add($updateUser);
		 	$auth->addChild($admin, $updateUser);
		 	// permiso de eliminar usuario
		 	$deleteUser = $auth->createPermission('deleteuser');
		 	$deleteUser->description = 'Eliminar usuarios del sistema';
		 	$auth->add($deleteUser);
		 	$auth->addChild($admin, $deleteUser);		 	
		 	// permiso de ver usuario
		 	$viewUser = $auth->createPermission('viewuser');
		 	$viewUser->description = 'Ver usuarios del sistema';
		 	$auth->add($viewUser);
		 	$auth->addChild($admin, $viewUser);

		 	// permiso de crear materia
		 	$createMateria = $auth->createPermission('createMateria');
		 	$createUser->description = 'Crear materia';
		 	$auth->add($createMateria);
		 	$auth->addChild($admin, $createMateria);

		 	// permiso de editar materia
		 	$updateMateria = $auth->createPermission('updateMateria');
		 	$updateUser->description = 'Editar materia';
		 	$auth->add($updateMateria);
		 	$auth->addChild($admin, $updateMateria);

		 	// permiso de eliminar materia
		 	$deleteMateria = $auth->createPermission('deleteMateria');
		 	$deleteUser->description = 'Eliminar materia';
		 	$auth->add($deleteMateria);
		 	$auth->addChild($superadmin, $deleteMateria);//solo superadmin puede borrar materia		 			 	

		 	// permiso de ver materia
		 	$viewMateria = $auth->createPermission('viewMateria');
		 	$viewUser->description = 'Ver materia';
		 	$auth->add($viewMateria);
		 	$auth->addChild($admin, $viewMateria);

		 	// permiso de crear Grupo
		 	$createGrupo = $auth->createPermission('createGrupo');
		 	$createUser->description = 'Crear Grupo';
		 	$auth->add($createGrupo);
		 	$auth->addChild($admin, $createGrupo);

		 	// permiso de editar Grupo
		 	$updateGrupo = $auth->createPermission('updateGrupo');
		 	$updateUser->description = 'Editar Grupo';
		 	$auth->add($updateGrupo);
		 	$auth->addChild($admin, $updateGrupo);

		 	// permiso de eliminar Grupo
		 	$deleteGrupo = $auth->createPermission('deleteGrupo');
		 	$deleteUser->description = 'Eliminar Grupo';
		 	$auth->add($deleteGrupo);
		 	$auth->addChild($superadmin, $deleteGrupo);//solo superadmin puede borrar Grupo		 			 	

		 	// permiso de ver Grupo
		 	$viewGrupo = $auth->createPermission('viewGrupo');
		 	$viewUser->description = 'Ver Grupo';
		 	$auth->add($viewGrupo);
		 	$auth->addChild($admin, $viewGrupo);

		 	// permiso de crear Equipo
		 	$createEquipo = $auth->createPermission('createEquipo');
		 	$createUser->description = 'Crear Equipo';
		 	$auth->add($createEquipo);
		 	$auth->addChild($admin, $createEquipo);

		 	// permiso de editar Equipo
		 	$updateEquipo = $auth->createPermission('updateEquipo');
		 	$updateUser->description = 'Editar Equipo';
		 	$auth->add($updateEquipo);
		 	$auth->addChild($admin, $updateEquipo);

		 	// permiso de eliminar Equipo
		 	$deleteEquipo = $auth->createPermission('deleteEquipo');
		 	$deleteUser->description = 'Eliminar Equipo';
		 	$auth->add($deleteEquipo);
		 	$auth->addChild($superadmin, $deleteEquipo);//solo superadmin puede borrar Equipo		 			 	

		 	// permiso de ver Equipo
		 	$viewEquipo = $auth->createPermission('viewEquipo');
		 	$viewUser->description = 'Ver Equipo';
		 	$auth->add($viewEquipo);
		 	$auth->addChild($admin, $viewEquipo);		 	

		 	//inicia create Author role

		 	/*

		 	$authorRule = new \app\rbac\AuthorRule();

		 	// permiso de crear Profile que es nombre y apellidos del author
		 	$createProfile = $auth->createPermission('createProfile');
		 	$viewUser->description = 'Crear Perfil';
		 	$auth->add($createProfile);

		 	// permiso de leer Profile 
		 	$readProfile = $auth->createPermission('readProfile');
		 	$viewUser->description = 'Leer Perfil';
		 	$auth->add($readProfile);		 	
		 	
			// add the "updateOwnPost" permission and associate the rule with it.
			 $updateOwnProfile = $auth->createPermission('updateOwnProfile');
			 $updateOwnProfile->description = 'Editar su propio perfil';
			 $updateOwnProfile->ruleName = $authorRule->name;
			 //$updateOwnProfile->ruleName = 'isAuthor vato forever';
			 $auth->add($updateOwnProfile);
			 $auth->addChild($updateOwnProfile, $updateProfile);
			// create Author role //crear Role Author
			 $author = $auth->createRole('author');
			 $auth->add($author);
			 $auth->addChild($author, $createProfile);
			 $auth->addChild($author, $updateOwnProfile);
			 $auth->addChild($author, $readProfile);			
			*/

			 //finaliza create Autor role

			// create Author role //crear Role Author --V2
			 $author = $auth->createRole('author');
			 $auth->add($author); 

			// permiso de crear Profile que es nombre y apellidos del author
		 	$createProfile = $auth->createPermission('createProfile');
		 	$viewUser->description = 'Crear Perfil';
		 	$auth->add($createProfile);

		 	// permiso de leer Profile 
		 	$readProfile = $auth->createPermission('readProfile');
		 	$viewUser->description = 'Leer Perfil';
		 	$auth->add($readProfile);

		 	$auth->addChild($author, $createProfile);
			$auth->addChild($author, $readProfile);			 

			// FINALIZA rOLE aUTHOR v2


		 	// permiso de crear FichaTerminologica
		 	$createFichaTerminologica = $auth->createPermission('createFichaTerminologica');
		 	$createUser->description = 'Crear FichaTerminologica';
		 	$auth->add($createFichaTerminologica);
		 	$auth->addChild($author, $createFichaTerminologica);

		 	// permiso de editar FichaTerminologica
		 	$updateFichaTerminologica = $auth->createPermission('updateFichaTerminologica');
		 	$updateUser->description = 'Editar FichaTerminologica';
		 	$auth->add($updateFichaTerminologica);
		 	$auth->addChild($author, $updateFichaTerminologica);

		 	// permiso de eliminar FichaTerminologica
		 	$deleteFichaTerminologica = $auth->createPermission('deleteFichaTerminologica');
		 	$deleteUser->description = 'Eliminar FichaTerminologica';
		 	$auth->add($deleteFichaTerminologica);
		 	$auth->addChild($author, $deleteFichaTerminologica);//solo superadmin puede borrar FichaTerminologica		 			 	

		 	// permiso de ver FichaTerminologica
		 	$viewFichaTerminologica = $auth->createPermission('viewFichaTerminologica');
		 	$viewUser->description = 'Ver FichaTerminologica';
		 	$auth->add($viewFichaTerminologica);
		 	$auth->addChild($author, $viewFichaTerminologica);	

		 	//se crea la jerarquía de permisos

		 	$auth->addChild($admin, $author);	 

			 // assign roles
			 $auth->assign($superadmin, User::findByUsername('alexrdz')->id);// se cambio findByUsername por findByEmail
			 $auth->assign($admin, User::findByUsername('tere')->id);
			 $auth->assign($admin, User::findByUsername('iona')->id);
			 $auth->assign($author, User::findByUsername('alumno1')->id);
			 $auth->assign($author, User::findByUsername('alumno2')->id);
			 $auth->assign($author, User::findByUsername('alumno3')->id);
			 $auth->assign($author, User::findByUsername('alumno4')->id);
			 $auth->assign($author, User::findByUsername('alumno5')->id);
			 $auth->assign($author, User::findByUsername('alumno6')->id);
			 $auth->assign($author, User::findByUsername('alumno7')->id);
			 $auth->assign($author, User::findByUsername('alumno8')->id);
			 $auth->assign($author, User::findByUsername('alumno9')->id);
			 $auth->assign($author, User::findByUsername('alumno10')->id);
			 echo "Done!\n";
			/*

			 $createPost = $auth->createPermission('createPost');
			 $createPost->description = 'Create a post';
			 $updatePost = $auth->createPermission('updatePost');
			 $updatePost->description = 'Update a post';
			 $updatePost = $auth->createPermission('updatePost');
			 $updatePost->description = 'Update a post';
			 $deletePost = $auth->createPermission('deletePost');
			 $deletePost->description = 'Delete a post';
			 $readPost = $auth->createPermission('readPost');
			 $readPost->description = 'Read a post';
			 $authorRule = new \app\rbac\AuthorRule();
			 // add permissions
			 $auth->add($createPost);
			 $auth->add($updatePost);
			 $auth->add($deletePost);
			 $auth->add($readPost);
			 $auth->add($authorRule);
			 // add the "updateOwnPost" permission and associate the rule with it.
			 $updateOwnPost = $auth->createPermission('updateOwnPost');
			 $updateOwnPost->description = 'Update own post';
			 $updateOwnPost->ruleName = $authorRule->name;
			 $auth->add($updateOwnPost);
			 $auth->addChild($updateOwnPost, $updatePost);
			  // create Author role
			 $author = $auth->createRole('author');
			 $auth->add($author);
			 $auth->addChild($author, $createPost);
			 $auth->addChild($author, $updateOwnPost);
			 $auth->addChild($author, $readPost);
			 // create Admin role
			 $admin = $auth->createRole('admin');
			 $auth->add($admin);
			 $auth->addChild($admin, $updatePost);
			 $auth->addChild($admin, $deletePost);
			 $auth->addChild($admin, $author);

			 */

			}catch(yii\console\Exception $e){
				throw new $e;
			} 
 	}

}