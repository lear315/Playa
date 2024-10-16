import { Event } from "../../../events/Event";
import { SubMesh } from "../../resource/models/SubMesh";
import { GeometryElement } from "../GeometryElement";
import { Transform3D } from "../Transform3D";
import { FastSinglelist, SingletonList } from "../../../utils/SingletonList";
import { VertexDeclaration } from "../../../RenderEngine/VertexDeclaration";
import { RenderElement } from "./RenderElement";


/**
 * @internal
 */
export class SubMeshRenderElement extends RenderElement {

	/** @internal */
	private _dynamicWorldPositionNormalNeedUpdate: boolean;

	/** @internal */
	staticBatchIndexStart: number;
	/** @internal */
	staticBatchIndexEnd: number;
	/** @internal */
	staticBatchElementList: FastSinglelist<SubMeshRenderElement>;

	/** @internal */
	instanceSubMesh: SubMesh;
	/** @internal */
	instanceBatchElementList: FastSinglelist<SubMeshRenderElement>;

	/** @internal */
	vertexBatchElementList: FastSinglelist<SubMeshRenderElement>;
	/** @internal */
	vertexBatchVertexDeclaration: VertexDeclaration;


	/**
	 * 创建一个 <code>SubMeshRenderElement</code> 实例。
	 */
	constructor() {
		super();
		this._dynamicWorldPositionNormalNeedUpdate = true;
		this._renderElementOBJ.canDynamicBatch = true;
	}

	/**
	 * @internal
	 */
	private _onWorldMatrixChanged(): void {
		this._dynamicWorldPositionNormalNeedUpdate = true;
	}


	/**
	 * @inheritDoc
	 * @override
	 */
	setTransform(transform: Transform3D): void {
		if (this.transform !== transform) {
			(this.transform) && (this.transform.off(Event.TRANSFORM_CHANGED, this, this._onWorldMatrixChanged));
			(transform) && (transform.on(Event.TRANSFORM_CHANGED, this, this._onWorldMatrixChanged));
			this._dynamicWorldPositionNormalNeedUpdate = true;
			this.transform = transform;
		}
	}

	/**
	 * @inheritDoc
	 * @override
	 */
	setGeometry(geometry: GeometryElement): void {
		if (this._geometry !== geometry) {
			this._geometry = geometry;
			this._renderElementOBJ.geometry = geometry._geometryElementOBj;
		}
	}

	/**
	 * @inheritDoc
	 * @override
	 */
	destroy(): void {
		if (!this._renderElementOBJ) return;
		(this.transform) && this.transform.off(Event.TRANSFORM_CHANGED, this, this._onWorldMatrixChanged);
		super.destroy();
		//this.staticBatch = null;
		this.instanceSubMesh = null;
		this.staticBatchElementList && this.staticBatchElementList.destroy();
		this.instanceBatchElementList && this.instanceBatchElementList.destroy();
		this.vertexBatchElementList && this.vertexBatchElementList.destroy();
		this.vertexBatchVertexDeclaration = null;
	}
}


