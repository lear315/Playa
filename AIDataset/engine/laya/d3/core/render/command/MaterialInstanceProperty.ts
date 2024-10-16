import { Vector2 } from "../../../../maths/Vector2";
import { Vector3 } from "../../../../maths/Vector3";
import { Vector4 } from "../../../../maths/Vector4";
import { BufferUsage } from "../../../../RenderEngine/RenderEnum/BufferTargetType";
import { VertexDeclaration } from "../../../../RenderEngine/VertexDeclaration";
import { VertexBuffer3D } from "../../../graphics/VertexBuffer3D";
import { Laya3DRender } from "../../../RenderObjs/Laya3DRender";
import { DrawMeshInstancedCMD } from "./DrawMeshInstancedCMD";

/**
 * @internal
 * <code>Mesh</code> 类用于创建CustomInstance属性。
 */
export class MaterialInstanceProperty {
	/**@internal instanceProperty name*/
	public _name: string;
	/**@internal property Data*/
	public _value: Vector4[] | Vector3[] | Vector2[] | Float32Array;
	/**@internal vertex Declaration */
	public _vertexDeclaration: VertexDeclaration;
	/**@internal */
	public _isNeedUpdate: boolean = false;
	/**@internal */
	public _vertexStride: number;
	/**@internal */
	public _instanceData: Float32Array;
	/**@internal */
	public _vertexBuffer: VertexBuffer3D;

	/**
	 * @internal
	 * 创建instance顶点Buffer
	 */
	createInstanceVertexBuffer3D() {
		this._instanceData = new Float32Array(DrawMeshInstancedCMD.maxInstanceCount * this._vertexStride);
		this._vertexBuffer = Laya3DRender.renderOBJCreate.createVertexBuffer3D(this._instanceData.length * 4, BufferUsage.Dynamic, false);
		this._vertexBuffer.vertexDeclaration = this._vertexDeclaration;
		this._vertexBuffer.instanceBuffer = true;
	}

	/**
	 * @internal
	 * 更新顶点数据
	 */
	updateVertexBufferData(drawNums: number) {
		//更新数据
		if (!this._isNeedUpdate)
			return;
		let instanceData = this._instanceData;
		let dataValue = this._value;
		let datalength = this._value.length;
		let data: Vector2 | Vector3 | Vector4;
		let stride = this._vertexStride;
		let updateType = 0;
		if (!(this._value instanceof Float32Array)) {
			updateType = 1;//判断为Vector数据
		}

		switch (updateType) {
			case 0:
				instanceData.set(<Float32Array>dataValue, 0);
				break;
			case 1:
				for (let i = 0; i < datalength; i++) {
					data = <Vector2 | Vector3 | Vector4>dataValue[i];
					data.writeTo(instanceData, i * stride);
				}
				break;
		}
		this._vertexBuffer._deviceBuffer.setDataLength(this._vertexBuffer._byteLength);
		this._vertexBuffer.setData(instanceData.buffer, 0, 0, drawNums * 4 * stride);
	}

	destroy() {
		delete this._value;
		delete this._instanceData;
		this._vertexDeclaration = null;
		this._vertexBuffer.destroy();
	}
}